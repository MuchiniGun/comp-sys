#include "VMTranslator.h"

#include <string>

using namespace std;

/**
 * VMTranslator constructor
 * Initializes the counters for various operations
 */
int VMTranslator::call_counter = 0;
int VMTranslator::pop_counter = 0;
int VMTranslator::eq_counter = 0;
int VMTranslator::gt_counter = 0;
int VMTranslator::lt_counter = 0;
int VMTranslator::return_counter = 0;

VMTranslator::VMTranslator() {
  // Constructor logic, if necessary, goes here
}

/**
 * VMTranslator destructor
 * Used to clean up any allocated resources (if any)
 */
VMTranslator::~VMTranslator() {
  // Destructor logic, if necessary, goes here
}

/**
 * Generates Hack assembly code for a VM push operation
 * segment: memory segment to push from
 * offset: value's position within the segment
 */
string VMTranslator::vm_push(string segment, int offset) {
  string symbol;
  string same_part = "@SP\nAM=M+1\nA=A-1\nM=D";
  string assembler_code;

  // constant values
  if (segment == "constant") {
    symbol = to_string(offset);
    assembler_code = "@" + symbol + "\nD=A\n" + same_part;
  } else if (segment == "static" || segment == "temp" || segment == "pointer") {
    if (segment == "static") {
      symbol = to_string(offset + 16);
    } else if (segment == "temp") {
      symbol = to_string(offset + 5);
    } else if (segment == "pointer") {
      symbol = (offset == 0) ? "THIS" : "THAT";
    }
    assembler_code = "@" + symbol + "\nD=M\n" + same_part;
  } else {
    if (segment == "local") {
      symbol = "LCL";
    } else if (segment == "argument") {
      symbol = "ARG";
    } else if (segment == "this") {
      symbol = "THIS";
    } else if (segment == "that") {
      symbol = "THAT";
    }

    if (offset >= 2) {
      assembler_code = "@" + to_string(offset) + "\nD=A\n@" + symbol +
                       "\nA=M+D\nD=M\n" + same_part;
    } else if (offset == 1) {
      assembler_code = "@" + symbol + "\nA=M+1\nD=M\n" + same_part;
    } else {
      assembler_code = "@" + symbol + "\nA=M\nD=M\n" + same_part;
    }
  }
  return assembler_code;
}

/**
 * Generates Hack assembly code for a VM pop operation
 * segment: memory segment to pop to
 * offset: position to pop into within the segment
 */
string VMTranslator::vm_pop(string segment, int offset) {
  string symbol = "";
  string same_part = "@SP\nAM=M-1\nD=M";
  string assembler_code;

  if (segment == "static" || segment == "temp" || segment == "pointer") {
    if (segment == "static") {
      symbol = to_string(offset + 16);
    } else if (segment == "temp") {
      symbol = to_string(offset + 5);
    } else if (segment == "pointer") {
      symbol = (offset == 0) ? "THIS" : "THAT";
    }
    assembler_code = same_part + "\n@" + symbol + "\nM=D";
  } else {
    if (segment == "local") {
      symbol = "LCL";
    } else if (segment == "argument") {
      symbol = "ARG";
    } else if (segment == "this") {
      symbol = "THIS";
    } else if (segment == "that") {
      symbol = "THAT";
    }

    if (offset >= 2) {
      assembler_code = "@" + to_string(offset) + "\nD=A\n@" + symbol +
                       "\nD=M+D\n@temp_pop" + to_string(pop_counter) +
                       "\nM=D\n" + same_part + "\n@temp_pop" +
                       to_string(pop_counter) + "\nA=M\nM=D";
    } else if (offset == 1) {
      assembler_code = same_part + "\n@" + symbol + "\nA=M+1\nM=D";
    } else {
      assembler_code = same_part + "\n@" + symbol + "\nA=M\nM=D";
    }
  }
  pop_counter++;

  return assembler_code;
}

/**
 * VM add operation: Generates assembly code for adding top two stack values
 */
string VMTranslator::vm_add() { return "@SP\nAM=M-1\nD=M\nA=A-1\nM=D+M"; }

/**
 * VM sub operation: Generates assembly code for subtracting top two stack
 * values
 */
string VMTranslator::vm_sub() { return "@SP\nAM=M-1\nD=M\nA=A-1\nM=M-D"; }

/**
 * VM neg operation: Generates assembly code for negating the top stack value
 */
string VMTranslator::vm_neg() { return "@SP\nA=M-1\nM=-M"; }

/**
 * VM eq operation: Generates assembly code to compare equality of top two stack
 * values
 */
string VMTranslator::vm_eq() {
  string assembler_code = "@SP\nAM=M-1\nD=M\nA=A-1\nD=D-M\n@TRUE_EQ" +
                          to_string(eq_counter) + "\nD;JEQ\nD=0\n@FALSE_EQ" +
                          to_string(eq_counter) + "\n0;JMP\n(TRUE_EQ" +
                          to_string(eq_counter) + ")\nD=-1\n(FALSE_EQ" +
                          to_string(eq_counter) + ")\n@SP\nA=M-1\nM=D";
  eq_counter++;
  return assembler_code;
}

/**
 * VM gt operation: Generates assembly code to check if second value is greater
 * than top value
 */
string VMTranslator::vm_gt() {
  string assembler_code = "@SP\nAM=M-1\nD=M\nA=A-1\nD=M-D\n@TRUE_GT" +
                          to_string(gt_counter) + "\nD;JGT\nD=0\n@FALSE_GT" +
                          to_string(gt_counter) + "\n0;JMP\n(TRUE_GT" +
                          to_string(gt_counter) + ")\nD=-1\n(FALSE_GT" +
                          to_string(gt_counter) + ")\n@SP\nA=M-1\nM=D";
  gt_counter++;
  return assembler_code;
}

/**
 * VM lt operation: Generates assembly code to check if second value is less
 * than top value
 */
string VMTranslator::vm_lt() {
  string assembler_code = "@SP\nAM=M-1\nD=M\nA=A-1\nD=D-M\n@TRUE_LT" +
                          to_string(lt_counter) + "\nD;JGT\nD=0\n@FALSE_LT" +
                          to_string(lt_counter) + "\n0;JMP\n(TRUE_LT" +
                          to_string(lt_counter) + ")\nD=-1\n(FALSE_LT" +
                          to_string(lt_counter) + ")\n@SP\nA=M-1\nM=D";
  lt_counter++;
  return assembler_code;
}

/**
 * VM and operation: Generates assembly code for bitwise AND of top two stack
 * values
 */
string VMTranslator::vm_and() { return "@SP\nAM=M-1\nD=M\nA=A-1\nM=D&M"; }

/**
 * VM or operation: Generates assembly code for bitwise OR of top two stack
 * values
 */
string VMTranslator::vm_or() { return "@SP\nAM=M-1\nD=M\nA=A-1\nM=D|M"; }

/**
 * VM not operation: Generates assembly code for bitwise NOT of the top stack
 * value
 */
string VMTranslator::vm_not() { return "@SP\nA=M-1\nM=!M"; }

/**
 * VM label operation: Generates assembly code to create a label
 */
string VMTranslator::vm_label(string label) { return "(" + label + ")"; }

/**
 * VM goto operation: Generates assembly code for an unconditional jump
 */
string VMTranslator::vm_goto(string label) { return "@" + label + "\n0;JMP"; }

/**
 * VM if-goto operation: Generates assembly code for a conditional jump based on
 * stack value
 */
string VMTranslator::vm_if(string label) {
  return "@SP\nAM=M-1\nD=M\n@" + label + "\nD;JNE";
}

/**
 * VM function operation: Generates assembly code for defining a function
 * and initializing local variables to zero
 */
string VMTranslator::vm_function(string function_name, int n_vars) {
  string assembler_code;
  for (int i = 0; i < n_vars; i++) {
    assembler_code += "\n" + vm_push("constant", 0);
  }
  return vm_label(function_name) + assembler_code;
}

/**
 * VM call operation: Generates assembly code for calling a function
 * and setting up the stack frame
 */
string VMTranslator::vm_call(string function_name, int n_args) {
  string assembler_code;
  assembler_code += "@RETURN_ADDRESS_CALL" + to_string(call_counter) +
                    "\nD=A\n@SP\nAM=M+1\nA=A-1\nM=D\n";
  assembler_code += "@LCL\nD=M\n@SP\nAM=M+1\nA=A-1\nM=D\n";
  assembler_code += "@ARG\nD=M\n@SP\nAM=M+1\nA=A-1\nM=D\n";
  assembler_code += "@THIS\nD=M\n@SP\nAM=M+1\nA=A-1\nM=D\n";
  assembler_code += "@THAT\nD=M\n@SP\nAM=M+1\nA=A-1\nM=D\n";
  assembler_code +=
      "@5\nD=A\n@SP\nD=M-D\n@" + to_string(n_args) + "\nD=D-A\n@ARG\nM=D\n";
  assembler_code += "@SP\nD=M\n@LCL\nM=D\n";
  assembler_code += "@" + function_name + "\n0;JMP\n";
  assembler_code += "(RETURN_ADDRESS_CALL" + to_string(call_counter) + ")";
  call_counter++;
  return assembler_code;
}

/**
 * VM return operation: Generates assembly code to return from a function
 * and restore the previous stack frame
 */
string VMTranslator::vm_return() {
  string assembler_code;
  assembler_code += "@LCL\nD=M\n@frame_return" + to_string(return_counter) +
                    "\nM=D\n@5\nA=D-A\nD=M\n@retAddr_return" +
                    to_string(return_counter) + "\nM=D\n";
  assembler_code += vm_pop("argument", 0) + "\n@ARG\nD=M+1\n@SP\nM=D\n";
  assembler_code += "@frame_return" + to_string(return_counter) +
                    "\nA=M-1\nD=M\n@THAT\nM=D\n";
  assembler_code += "@2\nD=A\n@frame_return" + to_string(return_counter) +
                    "\nA=M-D\nD=M\n@THIS\nM=D\n";
  assembler_code += "@3\nD=A\n@frame_return" + to_string(return_counter) +
                    "\nA=M-D\nD=M\n@ARG\nM=D\n";
  assembler_code += "@4\nD=A\n@frame_return" + to_string(return_counter) +
                    "\nA=M-D\nD=M\n@LCL\nM=D\n";
  assembler_code += "@retAddr_return" + to_string(return_counter) + "\nA=M;JMP";
  return_counter++;
  return assembler_code;
}

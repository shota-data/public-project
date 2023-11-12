// c_gをカットする
function transform(input, emitter, context) {
  if (input.c_g) {
    input.c_c = input.c_g.substr(0, 6);
  } else {
    input.c_c = null;
  }
  
  if (input.s_A != null || input.p_A != null 
     || input.s_B != null || input.p_B != null) {
    input.id += 'B';
    input.rp = 'B';
    input.s = input.s_B != null ? input.s_B: 0; 
    if(input.s_A != null){
      input.s -= input.s_A;
    }
    input.p = 0;
    if (input.p_B != null){
      input.p = input.p_B;
    }
    if (input.p_A != null){
      input.p -= input.p_A;
    }
    emitter.emit(input);
  }
  if (input.s_A != null || input.p_A != null) {
    input.id += 'A';
    input.rp = 'A';
    input.s = input.s_A;
    input.p = input.p_A;
    emitter.emit(input);
  }

  if (input.s_C != null || input.p_C != null) {
    input.id += 'C';
    input.rp = 'C';
    input.s = input.s_C;
    input.p = input.p_C;
    emitter.emit(input);
  }

  if (input.s_D != null || input.p_D != null) {
    input.id += 'D';
    input.rp = 'D';
    input.s = input.s_D;
    input.p = input.p_D;
    emitter.emit(input);
  }
  
  if (input.s_null != null || input.p_null != null) {
    input.id += 'null';
    input.rp = null;
    input.s = input.s_null;
    input.p = input.p_null;
    emitter.emit(input);
  }

}

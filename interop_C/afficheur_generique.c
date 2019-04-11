#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <stdio.h>

void rec_bloc(value val);

/* tag sert a faire la difference entre les différents constructors entre 0 et no_scan_tag */
/* au dessus, tag spéciaux */
/* string d'ocaml peut contenir des \0 
   -> parcours longueur sans s'arreter au premier \0 */
void generic_print(value val){
  int i;
  int size;
  
  CAMLparam1(val);
  // entier
  if (!Is_block(val))
    printf("%d\n",Int_val(val));
  else {
    // string
    if (Tag_val(val) == String_tag){
      size = caml_string_length(val);
      for (i = 0; i< size ; i++)
	printf("%c", Byte(val,i));
      printf("\n");
    }
    // float
    else if (Tag_val(val) == Double_tag){
      printf("%f\n",Double_val(val));
    }
    // float array
    else if (Tag_val(val) == Double_array_tag){
      size = Wosize_val(val);
      for (i = 0; i< size ; i++){
	if (i != 0)
	  printf(", ");
	printf("%f", Double_field(val,i));
      }
      printf("\n");
    }
    // fonction
    else if (Tag_val(val) == Closure_tag)
      printf("<fun>\n");
    // abstract
    else if (Tag_val(val) == Abstract_tag)
      printf("abstract\n");
    // custom
    else if (Tag_val(val) == Custom_tag)
      printf("custom\n");
    // non supporté
    else if (Tag_val(val) >= No_scan_tag)
      printf("unsupported\n");
    // bloc
    else{
      rec_bloc(val);
    }
  }
  CAMLreturn0;
}



void rec_bloc(value val){
  int size = Wosize_val(val);
  int i;
  
  printf("[ tag %d, size %d | ", Tag_val(val), Wosize_val(val));
  if (0 >= Int_val(Wosize_val(val)))
    return;
  for (i=0; i<size ; i++){
    if (i!=0)
      printf(", ");
    printf("%d", Int_val(Field(val,i)));

  }
  printf("]\n");
}

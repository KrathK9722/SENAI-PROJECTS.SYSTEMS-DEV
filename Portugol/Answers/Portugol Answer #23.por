programa {
  funcao inicio() {
    //Activitie #23 Read 5 numbers and say how many are greater than 10 and how many are less than or equal to 10.

    //Varaiveis
    real n
    inteiro i,me=0,ma=0

    //Processo
    escreva("----------------------------------------------\n")
    para(i=1;i<=5;i++){
      escreva("Digite o ",i,"º número: ")
      leia(n)
      se (n>10){
        ma = ma+1
      }
      senao {
        me = me +1
      }
    }
    escreva("\nQuantidade de valores maiores que 10: ",ma,"\nQuantidade de valores menores ou iguais a 10: ",me,"\n\n")
    escreva("----------------------------------------------")
  }
}

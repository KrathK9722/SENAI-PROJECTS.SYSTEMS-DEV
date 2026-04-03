programa {
  funcao inicio() {
    //Activitie #24 Read a integer and verify if it's a prime number

    //Variables
    inteiro n,i
    logico primo=verdadeiro

    //Process
    escreva("-------------------------------------------\n")
    escreva("Sistema para verificar se é um número primo:")
    escreva("\n\nDigite um número: ")
    leia(n)
    
    //Verify if can process
    se (n>0){
    //Loop
    para(i=n-1;i>1;i--){
        se(n%i==0){
          primo = falso  
      }
    }

    //Output
    se (primo == verdadeiro){escreva("\nSeu número é primo.")}
    senao{escreva("\nSeu número não é primo.")}
    }
    senao {
      escreva("\nO número digitado não é primo")
    }
    escreva("\n-------------------------------------------\n")
  }
}

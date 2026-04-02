programa {
  funcao inicio() {
    //Activitie #22 Calculate and display the factorial of a given number.

  
    //Variaveis
    real nD,n,fatorial
    inteiro i

    //Processo
    escreva("----------------------------------------------")
    escreva("\n\nDescubra o fatoria de qualquer número positivo")
    escreva("\n\nDigite o número: ")leia(nD)
    se (nD < 0)
    {
      escreva("\nValor invalido..")
    }
    senao{
      escreva(nD)
      fatorial = nD
      para(i=nD-1;i>0;i--){
        escreva("x",i)
        fatorial = fatorial * i

      }
      escreva("\n\nO Cálculo do fatorial é: ",fatorial)
      escreva("\n----------------------------------------------")

    }

    }
  }

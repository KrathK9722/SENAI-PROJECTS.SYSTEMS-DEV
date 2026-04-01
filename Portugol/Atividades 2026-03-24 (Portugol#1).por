programa { 
  //Atividades 24/03 #1 a #20 questões no slide


  //Bibliotecas para facilidade
	inclua biblioteca Util --> u
  inclua biblioteca Matematica --> mat

  funcao inicio() {

    //Variavel para mostrar atividades
    inteiro atividade

    escreva("Rodar atividade número:")
    leia(atividade)

    //Atividade 1
    se (atividade == 1) {

     cadeia nome
     inteiro idade
     real altura

     escreva("Bem vindo ao sistema.")

     escreva("\nDigite seu nome:")
     leia(nome)

     escreva("Digite sua idade:")
     leia(idade)

     se (idade >= 18) {
      escreva("Digite sua altura:")
      leia(altura)
      se (altura >= 40 e altura < 300){
        altura = altura / 100
      }
      senao se (altura >= 0.40 e altura < 3.0){}
      senao {
        escreva("Altura inválida, não salvaremos sua altura.")
        altura = 0.00
      }
      u.aguarde(1000)
      escreva("\n\nBem vindo ", nome, " você tem ", idade, " anos. Por ter 18 anos ou mais você pode entrar no sistema. \nSeus dados foram cadastrados parabéns: \n\nNome: ", nome,"\nIdade: ", idade, "\nAltura: ", altura, "\n")
     }
     senao {
      escreva("Você deve ser maior de 18 para acessar o sistema.")
     }
     }
  
    //Atividade 2
    se (atividade == 2){
      //Variaveis
      real n1
      real n2
      real media
      real soma
      cadeia comp

      //Processo
      escreva("\n\nMédia, soma e comparação de números:")
      escreva("\n\nDigite o 1º número:")
      leia(n1)
      escreva("Digite o 2º número:")
      leia(n2)
      soma = n1 + n2
      media = (n1 + n2) / 2
      se (n1 > n2){escreva(n1, " é maior que ", n2)}
      senao se (n1 < n2){escreva(n1, " é menor que ", n2)}
      senao {escreva(n1, "é igual a ", n2)}
      escreva("\nA soma dos dois números é: ", soma)
      escreva("\nA média dos dois números é: ", media)
      }
    //Atividade 3
    se (atividade == 3){
      //Variaveis
      real salario
      inteiro anos
      real aumento
      real salarioN
      inteiro porcentagem

      //Processo
      escreva("\nCálcule seu novo salário:")
      escreva("\n\nQual seu salário atual? ")
      leia(salario)
      escreva("Trabalha a quantos anos na empresa? ")
      leia(anos)
      se (anos >= 5){
        aumento = salario * (((anos / 5) * 10) / 100)

        salarioN = salario + aumento
        escreva("\nVocê recebera um aumento de R$", aumento," por trabalhar aqui a ", anos," anos, mudando seu salário de R$", salario," para R$", salarioN)
      }
      senao {escreva("Você não recebera aumento porque tem somente ",anos,"anos de trabalho.")}
      }
    //Atividade 4
    se (atividade == 4){
      //Variaveis
      real n1
      real n2
      real n3
      real media

      escreva("Cálculo de média:")
      escreva("\n\nDigite sua primeira nota: ")
      leia(n1)
      escreva("Digite sua segunda nota: ")
      leia(n2)
      escreva("Digite sua terceira nota: ")
      leia(n3)

      media = (n1 + n2 + n3) / 3

      escreva("\nSua média foi ",media,".")
      se (media >= 7) {escreva("\n\nVocê foi aprovado.")}
      senao {escreva("\n\nVocê foi reprovado.")}


     }
    //Atividade 5
    se (atividade == 5) {
      //Variavel
      real n
      cadeia tipoP, tipoI

      //Processo
      escreva("\nLendo números:")
      escreva("\n\nDigite o número:")
      leia(n)
      se (n > 0) {tipoP = "Positivo"}
      senao se (n<0) {tipoP = "Negativo"}
      senao {tipoP = "Nulo"}
      se (n % 2 == 0 ) {tipoI = "Par"}
      senao {tipoI = "Ímpar"}

      escreva("\nO número ",n," é ",tipoP," e é um número ",tipoI,".")

     }
    //Atividade 6
    se (atividade == 6) {
      //Variavel
      real valor
      inteiro quantidade
      real valorT
      real valorD

      //Processo
      escreva("-Cálculo valor de produto-")
      escreva("\n\nDigite a quantidade de produtos: ")
      leia(quantidade)
      escreva("Digite o valor do produto: ")
      leia(valor)
      valorT = valor * quantidade
      valorT = mat.arredondar(valorT, 2)
      se (valorT>100){valorD = valorT - (valorT * 0.05)
       valorD = mat.arredondar(valorD, 2)
       escreva("Sua compra recebeu um desconto de 5% mudando de R$",valorT," para R$",valorD,".")
      }
      senao {escreva("Sua compra ficou R$",valorT,".")}
      
     }
    //Atividade 7
    se (atividade == 7){
      //Variavel
      inteiro idade
      cadeia cat

      //Processo
      escreva("Digite sua idade: ")
      leia(idade)
      se (idade < 18) {cat = "crianças"}
      senao se (idade > 60) {cat = "idosos"}
      senao {cat = "adultos"}
      escreva("\nVocê esta na categoria de ",cat,".")
     }
    //Atividade 8 
    se (atividade == 8){
      //Variavel
      real base
      real base2
      real altura
      inteiro forma
      real area
      logico fazerCalculo
      cadeia tamanho
      
      //Processamento
      escreva("-Cálculo de área-")
      escreva("Qual a forma geométrica da área?\n(1)Triangulo\n(2)Retangulo\n(3)Trapézio\n\nDigite o número: ")
      leia(forma)
      se (forma == 2 ou forma == 1){
        escreva("\nDigite a altura: ")
        leia(altura)
        escreva("Digite a base: ")
        leia(base)
        fazerCalculo = verdadeiro

      }
      senao se (forma == 3) { 
        escreva("\nDigite a altura: ")
        leia(altura)
        escreva("Digite a base menor: ")
        leia(base)
        escreva("Digite a base maior: ")
        leia(base2)
        fazerCalculo = verdadeiro
      }
      senao {escreva("Valor inválido...")}
      
      se (fazerCalculo == verdadeiro) {
       //Form Triangulo
       se (forma == 1){area = (base * altura) / 2}
       //Form Retangulo
       senao se (forma ==2) {area = base * altura}
       //Form Trapézio
       senao se (forma == 3) {area = ((base2 + base) * altura) / 2}

       //Tamanho
       se (area <150){tamanho = "pequeno"}
       senao se (area > 350){tamanho = "grande"}
       senao {tamanho = "médio"}

       //Output
       escreva("A área é ",area," é uma area de tamanho ",tamanho,".")
      

      }
     }
    //Atividade 9
    se (atividade == 9) {
      //Variaveis
      real numero[3]
      real maior
      real menor
      inteiro posN
      
      //Processamento
      para(posN = 0; posN < 3; posN++){
       escreva("Digite o ",posN+1,"º número: ")
       leia(numero[posN])
      }
      maior = numero[0]
      menor = numero[0]

      para(posN = 0; posN < 3; posN++){
       se (numero[posN] > maior){
        maior = numero[posN]
       }
       se (numero[posN] < menor){
        menor = numero[posN]
       }
      }
      escreva("O menor número é ",menor," e o maior número é ",maior,".")
      
     }
    //Atividade 10
    se (atividade == 10){
     //Variaveis
     inteiro posN
     real n
     
     //Input
     escreva("Digite um número: ")
     leia(n)

     //Processo
     escreva("\n---Tabuada do número ",n,"---\n")
     para (posN = 0; posN<=10; posN++){
      escreva(n, "x",posN," = ", n*posN,"\n")
     }
     escreva("-------------------------")
     se(n % 3 == 0){escreva("\n",n," é multiplo de 3.")}
     senao {escreva("\n",n," não é multiplo de 3.")}
     escreva("\n-------------------------")
     }
    //Atividade 11
    se (atividade == 11){
      //Variaveis
      real media=0, soma=0, n
      inteiro i

      //Processo
      escreva("\n---------------------------------------------------")
      escreva("\nSoma e média dos numeros digitados\n\n")
      escreva("\nQuantos números quer digitar? ")
      leia(n)
      real numero[n]
      para (i=0;i<n;i++){
        escreva("Digite o ",i+1,"º número:")
        leia(numero[i])
        soma = soma + numero[i]
      }
      media = soma/n
      escreva("\nA soma dos algarismos é: ",soma,"\nA média é: ",media)
      escreva("\n---------------------------------------------------")
     }
    //Atividade 12
    se (atividade == 12){
      //Variaveis
      real n
      real soma=0
      inteiro i

      //Processo
      escreva("\n\n---------------------------------------------------")
      escreva("\nSoma de quantos números pares foram digitados\n\n")
      para (i=0;i<=4;i++){
        escreva("Digite o ",i+1,"º número:")
        leia(n)
        se(n % 2 == 0){
          soma++
        }
      }
      escreva("\nQuantidade de números pares digitados: ",soma)
      escreva("\n---------------------------------------------------")

     }
    //Atividade 13
    se (atividade == 13){
    }

  }
}


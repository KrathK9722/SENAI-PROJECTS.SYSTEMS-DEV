programa {
  //Bibliotecas Portugol
    inclua biblioteca Texto --> txt
    inclua biblioteca Matematica --> mat
    inclua biblioteca Tipos --> t
    inclua biblioteca Util --> u

  /*
  Practical Activity - Simulation of Grade Recording and Analysis
  Completed all the extra challenges of the activity.

  Note: It is recommended to maximize the console/terminal size to improve visibility while the program is running.
  Made by: Arthur H. Kochan 
  */

  //DECLARAÇÃO DE VARIÁVEIS:

  //Variveis de exibição:
    cadeia alunos[5]
    cadeia notasTexto[5][15] //Variável convertida da variável notas 
    cadeia medias[5][5]
    cadeia status[5]
    cadeia materias[5] = {"Português","Matemática","Ciências","História","Ed Física"}

  //Variaveis de Cálculo:
    real notas[5][15]
    real notaDigitada
    real mediaCalculo[5][5] 

  //Varivaveis de Posição/loops:
    cadeia opcaoTexto
    inteiro opcaoValor
    inteiro indiceAluno, indiceMateria, indiceNota, coluna 
    logico rodarMenu, rodarOpcao
    logico passouRecuperacao[5]
  
  //FUNÇÕES:

    //CADASTRO DE ALUNOS
    funcao semCadastro(){ 
      opcaoValor = 0
      escreva("+============ Alunos não cadastrados ============+")
      para(inteiro i=0;i<5;i++){
        se (alunos[i] == "Sem cadastro no sistema"){
          escreva("\n- ID:",i," ",alunos[i])
          opcaoValor = 1
        }
      }
      se(opcaoValor == 0){
        escreva("\nTodos os alunos foram cadastrados, retornando para o menu.")
        para(inteiro i=0;i<4;i++){
          u.aguarde(500)
          escreva(".")
        }
        escreva("\n+============================================+\n")
      }
      se(opcaoValor == 1){
        escreva("\n+============================================+\n")
        escreva("\nQuer fazer o cadastro de qual aluno?")
        escreva("\nDigite o ID: ")
        leia(opcaoValor)
        se (alunos[opcaoValor] == "Sem cadastro no sistema"){
          rodarOpcao = verdadeiro
          enquanto(rodarOpcao == verdadeiro){
            escreva("\nDigite o nome do aluno: ")
            leia(opcaoTexto)
            opcaoTexto = txt.substituir(opcaoTexto, " ", "")  //Verifica se o texto tem espaços e remove eles pra verificar se o nome esta vazio
            se (opcaoTexto != ""){    
              alunos[opcaoValor] = txt.caixa_alta(opcaoTexto)
              rodarOpcao = falso
            }
            senao{
              escreva("\nNome inválido...")
            }
          }
        }
        senao{
          mensagemRetorno("Opção invalida, retornando ao menu...")
        }
      }
    }
    //CADASTRO DE NOTAS
    funcao alterarNota(){ //Função que localiza o ponto correto na matriz notas e armazena o valor digitado
      opcaoValor = 0
        tabelaAlunos()
        escreva("\nDigite o ID do aluno: ")
        leia(indiceAluno)
        se(indiceAluno >=0 e indiceAluno <= 4){
          se(alunos[indiceAluno] != "Sem cadastro no sistema"){
            enquanto(opcaoValor == 0){
              limpa()
              escreva("Qual matéria vai avaliar?\n(0)Português\n(1)Matemática\n(2)Ciências\n(3)História\n(4)Ed Física\n\nDigite a opção: ")
              leia(indiceMateria)

              se(indiceMateria >= 0 e indiceMateria <=4){
                escreva("Qual nota você quer Adicionar/Alterar?\n(0)Primeira nota\n(1)Segunda nota\n(2)Terceira nota\n(3)Um valor para todas\n\nDigite a opção: ")
                leia(indiceNota)

                
                se(indiceNota >= 0 e indiceNota <=2){
                  coluna = indiceMateria * 3 + indiceNota 
                  escreva("\nDigite a nota do aluno: ")
                  leia(notas[indiceAluno][coluna])

                  se(notas[indiceAluno][coluna] >= 0 e notas[indiceAluno][coluna] <= 10){
                    notaParaTexto(indiceAluno,coluna) 
                    limpa()
                    escreva("\nNota Salva no sistema.")
                    escreva("\nContinuar editando notas")
                    se(confirmar()){
                      opcaoValor = 0
                    }
                    senao{
                      opcaoValor = 1
                    }
                  }
                  senao{
                    mensagemRetorno("\nValor invalido retornando ao menu...")
                }
              }
              senao se(indiceNota == 3){    //Opção que coloca mesma nota para todas as posições de nota da matéria
                escreva("\nDigite o valor para todas as notas da matéria: ")
                leia(notaDigitada)
                para(inteiro i = 0;i<3;i++){
                  coluna = indiceMateria * 3 + i
                  notas[indiceAluno][coluna] = notaDigitada
                  escreva(notas[indiceAluno][coluna])
                  se(notas[indiceAluno][coluna] >= 0 e notas[indiceAluno][coluna] <= 10){
                   notaParaTexto(indiceAluno,coluna)
                   se(i==2){
                    limpa()
                    escreva("\nNota Salva no sistema.")
                    escreva("\nContinuar editando notas")
                      se(confirmar()){
                        opcaoValor = 0
                      }
                      senao{
                        opcaoValor = 1
                      }                 
                   }
                  }
                  senao{
                    i=3
                    limpa()
                    mensagemRetorno("\nValor invalido retornando ao menu...")
                  }
                }                                        
              }
              senao{
                mensagemRetorno("\nOpção invalida retornando ao menu...")
              }
            }
            senao{
              mensagemRetorno("\nOpção invalida retornando ao menu...")
            }
            }
          }
          senao{
            mensagemRetorno("\nID sem cadastro, retornando...")
          }
          mostrarBoletim()         
        }
        senao{limpa()
          mensagemRetorno("\nID inválido, retornando ao menu...")    
        }
    }
    //CALCULO DE MÉDIAS
    funcao calMedia(){ //Verifica se todas as notas estão cadastradas e calcula a média ponderada
      inteiro i
      inteiro posNota=0
      para(inteiro posMedia=0;posMedia<=4;posMedia++){
        i=posNota
        para(posNota=i;posNota<=i+2;posNota=posNota+3){
          se(notas[indiceAluno][posNota] >=0 e notas[indiceAluno][posNota] <= 10 e notas[indiceAluno][posNota+1] >=0 e notas[indiceAluno][posNota+1] <= 10 e notas[indiceAluno][posNota+2] >=0 e notas[indiceAluno][posNota+2] <= 10){
            mediaCalculo[indiceAluno][posMedia] = ((notas[indiceAluno][posNota]*2) + (notas[indiceAluno][posNota+1]*3) + (notas[indiceAluno][posNota+2]*5)) / 10
            se(mediaCalculo[indiceAluno][posMedia] == mat.arredondar(mediaCalculo[indiceAluno][posMedia], 0)){
              medias[indiceAluno][posMedia] = t.real_para_cadeia(mediaCalculo[indiceAluno][posMedia]) + ".0"
            }
            senao{
              medias[indiceAluno][posMedia] = t.real_para_cadeia(mat.arredondar(mediaCalculo[indiceAluno][posMedia],1))
            }
          }
          senao{
            medias[indiceAluno][posMedia] = "Falta de notas cadastradas."
            mediaCalculo[indiceAluno][posMedia] = -1
          }
        }
      }
    }
    //EXIBIÇÃO DE RELATÓRIOS
    funcao tabelaAlunos(){  
      limpa()
      escreva("+============ Alunos ============+")
      para(inteiro i=0;i<5;i++){
        escreva("\n- ID:",i," ",alunos[i])
      }
      escreva("\n+================================+\n")
    }
    funcao mostrarBoletim(){
      calMedia()
      se(passouRecuperacao[indiceAluno]==falso){
      status[indiceAluno] = "Sem informações suficientes."
        para(inteiro i=0;i<5;i++){ //Loop verifica se todas as médias estão cálculadas e diz o status final
          se(status[indiceAluno] != "Não passou de Ano."){
            se(mediaCalculo[indiceAluno][i] <7 e mediaCalculo[indiceAluno][i] >=0){
              status[indiceAluno] = "Não passou de Ano."
            }
            senao se(mediaCalculo[indiceAluno][i] >= 7){
              status[indiceAluno] = "Passou de Ano."
            }
          }
        }
        para(inteiro i=0;i<5;i++){
          se(mediaCalculo[indiceAluno][i] < 0){
            status[indiceAluno] = "Sem informações suficientes."
          }
        }
      }
      escreva("\n\n============== DADOS =============", //Boletim único para cada cadastro, informações podem ser acessadas quando quiser durante a execução do código
                "\nAluno: ",alunos[indiceAluno],
                "\nID de estudante: ",indiceAluno,
                "\n========= MÉDIA PONDERADA ========\n",
                  "Peso das noas:\n",
                  "1º Nota: Peso 2\n",
                  "2º Nota: Peso 3\n",
                  "3º Nota: Peso 5\n",
                  "============= BOLETIM ============\n",
                  "|Matérias  |Nota 1|Nota 2|Nota 3|\n",
                  "+----------+------+------+------+\n",
                  "|Portugûes | ",notasTexto[indiceAluno][0],"  | ",notasTexto[indiceAluno][1],"  | ",notasTexto[indiceAluno][2],"  | Média da matéria: ",medias[indiceAluno][0],"\n",
                  "+----------+------+------+------+\n",
                  "|Matemática| ",notasTexto[indiceAluno][3],"  | ",notasTexto[indiceAluno][4],"  | ",notasTexto[indiceAluno][5],"  | Média da matéria: ",medias[indiceAluno][1],"\n",
                  "+----------+------+------+------+\n",
                  "|Ciências  | ",notasTexto[indiceAluno][6],"  | ",notasTexto[indiceAluno][7],"  | ",notasTexto[indiceAluno][8],"  | Média da matéria: ",medias[indiceAluno][2],"\n",
                  "+----------+------+------+------+\n",
                  "|História  | ",notasTexto[indiceAluno][9],"  | ",notasTexto[indiceAluno][10],"  | ",notasTexto[indiceAluno][11],"  | Média da matéria: ",medias[indiceAluno][3],"\n",
                  "+----------+------+------+------+\n",
                  "|Ed Física | ",notasTexto[indiceAluno][12],"  | ",notasTexto[indiceAluno][13],"  | ",notasTexto[indiceAluno][14],"  | Média da matéria: ",medias[indiceAluno][4],"\n",
                  "=================================\n",
                  "Status: ", status[indiceAluno]
      )
      se (status[indiceAluno] == "Não passou de Ano."){
        escreva("\n\nObservação: O aluno poderá realizar a prova final ao término do ano letivo. Se alcançar nota igual ou superior a 7, será considerado aprovado.")                            //FINALIZAR RECUPERAÇÃO
        escreva("\nAluno fez a prova de recuperação?")
        se(confirmar()){
          escreva("\nDigite a nota da recuperação: ")
          leia(notaDigitada)
          se(notaDigitada >= 7 e notaDigitada<= 10){
            passouRecuperacao[indiceAluno] = verdadeiro
            cadeia texto
            se(notaDigitada == mat.arredondar(notaDigitada, 0)){
              status[indiceAluno] = "Passou de Ano com prova de recuperação geral e média final: " + t.real_para_cadeia(notaDigitada) + ".0"
            }
            senao{
              status[indiceAluno] = "Passou de Ano com prova de recuperação e média final: " + t.real_para_cadeia(mat.arredondar(notaDigitada,1))
            }
            escreva("\nAluno aprovado! Você pode visualizar o boletim novamente voltando ao menu e conferir o status do aluno.")
            escreva("\nDigite qualquer tecla para coninuar: ")
            leia(opcaoTexto)
          }
          senao se(notaDigitada < 7 e notaDigitada >= 0){
            escreva("\nAluno reprovado.")
            escreva("\nDigite qualquer tecla para coninuar: ")
            leia(opcaoTexto)
          }
          senao{
            mensagemRetorno("Valor inválido, retornando ao menu...")
          }

        }
      }
      senao{
        escreva("\nDigite qualquer tecla para coninuar: ")
        leia(opcaoTexto)
      }
    }
    funcao estatisticaMateria(){
      limpa()
      escreva("Quer ver as estatísticas de qual matéria?\n(0)Português\n(1)Matemática\n(2)Ciências\n(3)História\n(4)Ed Física\n\nDigite a opção: ")
      leia(indiceMateria)
      limpa()
      para(indiceAluno=0;indiceAluno<5;indiceAluno++){
        calMedia()
      }
      escreva("============= ", materias[indiceMateria] ," ============\n",
              "|Alunos |Nota 1|Nota 2|Nota 3|\n",
              "+----------+------+------+------+\n",
              "|ID:0 ",alunos[0] ,"| ",notasTexto[0][indiceMateria * 3 + 0],"  | ",notasTexto[0][indiceMateria * 3 + 1],"  | ",notasTexto[0][indiceMateria * 3 + 2],"  | Média da matéria: ",medias[0][indiceMateria],"\n",
              "+----------+------+------+------+\n",
              "|ID:1 ",alunos[1] ,"| ",notasTexto[1][indiceMateria * 3 + 0],"  | ",notasTexto[1][indiceMateria * 3 + 1],"  | ",notasTexto[1][indiceMateria * 3 + 2],"  | Média da matéria: ",medias[1][indiceMateria],"\n",
              "+----------+------+------+------+\n",
              "|ID:2 ",alunos[2] ,"| ",notasTexto[2][indiceMateria * 3 + 0],"  | ",notasTexto[2][indiceMateria * 3 + 1],"  | ",notasTexto[2][indiceMateria * 3 + 2],"  | Média da matéria: ",medias[2][indiceMateria],"\n",
              "+----------+------+------+------+\n",
              "|ID:3 ",alunos[3] ,"| ",notasTexto[3][indiceMateria * 3 + 0],"  | ",notasTexto[3][indiceMateria * 3 + 1],"  | ",notasTexto[3][indiceMateria * 3 + 2],"  | Média da matéria: ",medias[3][indiceMateria],"\n",
              "+----------+------+------+------+\n",
              "|ID:4 ",alunos[4] ,"| ",notasTexto[4][indiceMateria * 3 + 0],"  | ",notasTexto[4][indiceMateria * 3 + 1],"  | ",notasTexto[4][indiceMateria * 3 + 2],"  | Média da matéria: ",medias[4][indiceMateria],"\n",
                  "=================================\n"
      )
      escreva("\nDigite qualquer tecla para coninuar: ")
      leia(opcaoTexto)
    }
    //OUTRAS FUNÇÕES
    funcao mensagemRetorno(cadeia texto){ //Funçao utilizada sempre que uma resposta é inválida e precisa voltar ao menu
      limpa()
      escreva(texto)
      u.aguarde(2000)
    }
    funcao logico confirmar(){
      escreva("\nConfirmar? (sim/não): ")
      leia(opcaoTexto)
      opcaoTexto = txt.caixa_alta(opcaoTexto)
      se (opcaoTexto == "SIM" ou opcaoTexto == "S" ){
        retorne verdadeiro
      }
      senao{
        retorne falso
      }
    }
    funcao inicioDeVariaveis(inteiro aluno,logico reset){ //Função que reseta as variáveis dos alunos ou notas
      indiceAluno=aluno     
      se(reset == verdadeiro){
        para(indiceAluno=aluno;indiceAluno<5;indiceAluno++){
          para(coluna=0;coluna<15;coluna++){
           alunos[indiceAluno] = "Sem cadastro no sistema"
           notasTexto[indiceAluno][coluna] = "___"
           notas[indiceAluno][coluna] = -1
           passouRecuperacao[indiceAluno] = falso
          }
        }
      }
      senao{
        para(coluna=0;coluna<15;coluna++){
          notasTexto[indiceAluno][coluna] = "___"
          notas[indiceAluno][coluna] = -1
        }
        passouRecuperacao[indiceAluno] = falso
        
        
      }
    }
    funcao notaParaTexto(inteiro indiceAluno, inteiro coluna){  //Função que obriga a nota a ter uma casa decimal
      se (notas[indiceAluno][coluna] == mat.arredondar(notas[indiceAluno][coluna], 0)){
        notasTexto[indiceAluno][coluna] = t.real_para_cadeia(notas[indiceAluno][coluna]) + ".0"
      } 
      senao{
        notasTexto[indiceAluno][coluna] = t.real_para_cadeia(notas[indiceAluno][coluna])
      }
    }
  //PROCESSAMENTO E UTILIZAÇÃO DAS FUNÇÕES
    funcao inicio(){
      inicioDeVariaveis(0,verdadeiro) 
      escreva("Bem vindo ao sistema de gerenciamento da classe.")
      //Inicialização
      escreva("\n\nGostaria de iniciar o sistema?")
      se(confirmar()){
        //MENU GERAL
        rodarMenu = verdadeiro
        enquanto(rodarMenu == verdadeiro){
          limpa()
          escreva("=========== Menu ===========",
                  "\n(1)Cadastrar aluno",
                  "\n(2)Adicionar/Alterar Nota",
                  "\n(3)Ver todos os alunos",
                  "\n(4)Resetar cadastros",
                  "\n(5)Resetar notas do aluno",
                  "\n(6)Visualizar boletim",
                  "\n(7)Estatísticas por matéria",
                  "\n(0)Sair do sistema",
                  "\n==========================",
                  "\n\nDigite uma opção: "
          )
          leia(opcaoValor)

          escolha(opcaoValor){
            caso 1: //Cadastro Alunos
              limpa()
              semCadastro()
              pare
            caso 2: //Cadastro Notas
              limpa()
              alterarNota()
              pare
            caso 3: //Ver Alunos
              tabelaAlunos()
              escreva("\n\nDigite qualquer tecla para coninuar: ")
              leia(opcaoTexto)
              pare
            caso 4: //Resetar alunos
              limpa()
              escreva("Quer mesmo resetar todos os cadastros?")
              se(confirmar()){
                inicioDeVariaveis(0, verdadeiro)
                escreva("Todos os cadastros foram resetados.")
                escreva("\nDigite qualquer tecla para coninuar: ")
                leia(opcaoTexto)
              }
              senao{
                mensagemRetorno("Voltando ao menu...")
              }
              pare
            caso 5: //Resetar notas do aluno 
              limpa()
              tabelaAlunos()
              escreva("\nDigite o ID do aluno que pretende remover as notas: ")
              leia(opcaoValor)
              inicioDeVariaveis(opcaoValor, falso)
              escreva("\nNotas do aluno removidas...")
              escreva("\n\nDigite qualquer tecla para coninuar: ")
              leia(opcaoTexto)
              limpa()
              mostrarBoletim()
              pare
            caso 6: //Boletim
              limpa()
              escreva("Mostrar todos os boletins? Digite não caso queira ver o boletim de um aluno especifico.")
              se(confirmar()){
              limpa()
               para(indiceAluno=0;indiceAluno<5;indiceAluno++){
                mostrarBoletim()
               }
              }
              senao {
                escreva("\n\nQuer ver o boletim de qual aluno?")
                tabelaAlunos()
                escreva("\nDigite o ID: ")
                leia(indiceAluno)
                limpa()
                mostrarBoletim()
              }
              pare
            caso 7: //Boletim da matéria especifica
              estatisticaMateria()
              pare
            caso 0: //Fechamento do sistema
              limpa()
              rodarMenu = falso
              pare
            caso contrario:
            mensagemRetorno("Opção inválida, selecione novamente...")
          }
        }
      }
      senao{
        rodarMenu = falso
      }       
      //Finalização do sistema
      se (rodarMenu == falso){
        limpa()
        escreva("Saindo do sistema.")
        para(inteiro i=0;i<6;i++){
          u.aguarde(500)
          escreva(".")
        }
      }
   }
}

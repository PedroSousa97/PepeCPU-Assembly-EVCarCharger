;Declaração de constantes a usar ao longo do programa

;----------------------------------;
;----Endereços de periféricos------;
;----------------------------------;
ON_OFF          EQU     400H    ;Endereço do periférico de entrada que lê o ligar da máquina
opcao           EQU     410H    ;Endereço do periférico de entrada que lê as opções selecionadas
OK              EQU     420H    ;Endereço do periférico de entrada que lê o botão de OK
Cancel          EQU     430H    ;Endereço do periférico de entrada que lê o botão de Cancel
Carga_Carro     EQU     440H    ;Endereço do periférico de entrada que lê a bateria do carro 0%-100%
ID_Cartao       EQU     450H    ;Endereço do periférico de entrada que lê o ID do cartao
Password        EQU     460H    ;Endereço do periférico de entrada que lê a password
Conexao_admin   EQU     470H    ;Endereço do periférico de entrada que lê a ativação do modo admin
Pass_admin      EQU     480H    ;Endereço do periférico de entrada que lê a password do admin
Bateria_normal  EQU     490H    ;Endereço que guarda a quantidade de energia na bateria do modo normal
Bateria_rapido  EQU     4A0H    ;Endereço que guarda a quantidade de energia na bateria do modo rapido
Bateria_Srapido EQU     4B0H    ;Endereço que guarda a quantidade de energia na bateria do modo super rapido

;Interface Display 
;----------------------------------;
;-------------Display--------------;
;----------------------------------;
Display         EQU     500H        ;Endereço de início do display
Display_end     EQU     56Fh        ;Endereço de fim do display
Caracter_Vazio  EQU     20H         ;Valor utilizado para preencher espaços vazios do display, utilizado para limpar o display

;----------------------------------;
;-----------Constantes-------------;
;----------------------------------;
Uma_hora        EQU     1           ;Valor de opção do menu do tempo para uma hora  
Duas_horas      EQU     2           ;Valor de opção do menu do tempo para duas horas  
Tres_horas      EQU     3           ;Valor de opção do menu do tempo para três horas 
Quatro_horas    EQU     4           ;Valor de opção do menu do tempo para quatro horas 
Cinco_horas     EQU     5           ;Valor de opção do menu do tempo para cinco horas

Preco_normal    EQU     1           ;Valor do preço por hora do carregamento normal
Preco_rapido    EQU     2           ;Valor do preço por hora do carregamento rapido
Preco_srapido   EQU     3           ;Valor do preço por hora do carregamento super rapido

Percent_normal  EQU     20          ;Percentagem de carregamento por hora, para o carregamento normal
Percent_rapisdo EQU     60          ;Percentagem de carregamento por hora, para o carregamento rápido
Percent_srapido EQU     100         ;Percentagem de carregamento por hora, para o carregamento super rápido
max_bateria_car EQU     100         ;Percentagem máxima de carregamento de um veículo (100%)

Carga_normal    EQU     4           ;Energia fornecida pelo posto no carregamento normal, usado para descarregar as baterias após um carregamento
Carga_rapido    EQU     22          ;Energia fornecida pelo posto no carregamento rápido, usado para descarregar as baterias após um carregamento
Carga_srapido   EQU     50          ;Energia fornecida pelo posto no carregamento super rápido, usado para descarregar as baterias após um carregamento

Modo_normal     EQU     1           ;Valor de opção do menu do tipo de carregamento para carregamento normal  
Modo_rapido     EQU     2           ;Valor de opção do menu do tipo de carregamento para carregamento rápido 
Modo_Srapido    EQU     3           ;Valor de opção do menu do tipo de carregamento para carregamento super rápido

Admin_conect    EQU     1           ;Valor obtido quando admin se conecta à máquina para realizar carregamento

;----------------------------------;
;-----------Stack Pointer----------;
;----------------------------------;
Stack_Pointer   EQU     8000H       ;Endereço da Stack
;----------------------------------;
;----------Password Admin----------;
;----------------------------------;
Place 3F0H
Admin:  WORD 12345                  ;Guarda a password do admin no endereço 12345

;----------------------------------;
;------------Interfaces------------;
;----------------------------------;
;Endereço de início a partir do qual serão armazenados os diferentes tipos de displays a apresnetar ao utilizador
PLACE 4000H                        

Menu_Estado_nao_Operacional:        ;Menu para posto não operacional
    String "      UMa       "
    String "   Electrify    "
    String "                "
    String "-Fora de Servico"
    String "       :(       "
    String "                "
    String "                "

PLACE 4080H

Menu_Admin:                         ;Menu Admin, quando admin conecta-se e a pass está correta carrega baterias do posto
    String "   Menu Admin   "
    String "                "
    String " Baterias Foram "
    String "   Carregadas   "
    String "                "
    String "Cada Bateria Tem"
    String "300kW Clique OK "

PLACE 4100H

Menu_Operacional:                   ;Menu para posto operacional
    String "      UMa       "
    String "   Electrify    "
    String "                "
    String " Operacional :) "
    String "                "
    String "Clique OK Para  "
    String "Continuar       "

PLACE 4180H

Menu_ID:                            ;Menu que pede a introdução do ID/cartão
    String "      UMa       "
    String "   Electrify    "
    String "                "
    String "Introduza o Seu "
    String "Cartao de Utente"
    String "  E Clique OK   "
    String "Cancel para sair"

PLACE 4200H

Menu_ID_Invalido:                   ;Menu para para ID inválidos que não existam na BD
    String "      UMa       "
    String "   Electrify    "
    String "                "
    String "  ID Invalido   "
    String "                "
    String "Clique OK Para  "
    String "Continuar       "

PLACE 4280H

Menu_Password:                      ;Menu para inserção de password
    String "      UMa       "
    String "   Electrify    "
    String "                "
    String "Introduza a Sua "
    String "   Password     "
    String "  E Clique OK   "
    String "Cancel para sair"

PLACE 4300H

Menu_Password_invalida:             ;Menu para passwords invalida: não coincidem com a da base de dados
    String "      UMa       "
    String "   Electrify    "
    String "                "
    String "    Password    "
    String "    Invalida    "
    String "Clique OK Para  "
    String "Tentar novamente"

PLACE 4380H

Menu_Carregamento:                  ;Menu para escolha de tipo de carregamento
    String "  Escolha o seu "
    String "  Carregamento  "
    String "                "
    String "1- Normal       "
    String "2- Rapido       "
    String "3- Super Rapido "
    String "                "

PLACE 4400H

Menu_Opcao_invalida:                ;Menu para opções inválidas
    String "      UMa       "
    String "   Electrify    "
    String "                "
    String "     Opcao      "
    String "    Invalida    "
    String "                "
    String "   Clique OK    "

PLACE 4480H

Menu_Tempo_normal:                  ;Menu de tempo para o carregamento normal
    String "Escolha o tempo "
    String "(3.7kWh 1E/hora)"
    String "1- Uma Hora     "
    String "2- Duas Horas   "
    String "3- Tres Hora    "
    String "4- Quatro Horas "
    String "5- Cinco Horas  "

PLACE 4500H

Menu_Tempo_rapido:                  ;Menu de tempo para o carregamento rapido
    String "Escolha o tempo "
    String "(22kW/h 2E/hora)"
    String "                "
    String "1- Uma Hora     "
    String "2- Duas Horas   "
    String "                "
    String "                "

PLACE 4580H

Menu_Tempo_Srapido:                 ;Menu de tempo para o carreganento super rápido
    String "Escolha o tempo "
    String "(50kW/h 3E/hora)"
    String "                "
    String "                "
    String "1- Uma Hora     "
    String "                "
    String "                "

PLACE 4600H

Menu_saldo_insuficiente:            ;Menu de saldo insuficiente
    String "      UMa       "
    String "   Electrify    "
    String "                "
    String "     Saldo      "
    String "  Insuficiente  "
    String "                "
    String "   Clique OK    "

PLACE 4680H

Menu_carregamento_sem_carga:        ;Menu para tipos de carregamento sem carga na bateria
    String "    Opcao de    "
    String "  Carregamento  "
    String "  Indisponivel  "
    String "                "
    String " Escolha outra  "
    String "     Opcao      "
    String "   Clique OK    "

PLACE 4700H

Menu_carregamento_feito:            ;Menu de carregamento bem sucedido
    String "      UMa       "
    String "   Electrify    "
    String "                "
    String "  Carregamento  "
    String "    Efetuado    "
    String "                "
    String "   Clique OK    "

PLACE 4780H

Menu_carregamento_supera_carga:         ;Menu para carregamentos que excedem o máximo de bateria do carro
    String "                "
    String "  Carregamento  "
    String "  Supera Carga  "
    String "    Maxima do   "
    String "     Veiculo    "
    String "(Cancel)        "
    String "Confirmar -> OK "

PLACE 4800H

Menu_conecta_carro:                 ;Menu que aguarda que utilizador conecte bateria do carro ao posto (input de quantidade de bateria inicial)
    String "      UMa       "
    String "   Electrify    "
    String "                "
    String " Conecte o seu  "
    String "    Veiculo     "
    String "                "
    String "   Clique OK    "


;----------------------------------;
;-----------BASE DE DADOS----------;
;----------------------------------;
PLACE 6000H
Base_Dados: WORD 7  ;Quantidade de utilizadores
            ;USER 1         ;(ID,PASSWORD,SALDO)
            WORD 23134
            WORD 2345
            WORD 20
            ;USER2
            WORD 25436
            WORD 3214
            WORD 2
            ;USER3
            WORD 32134
            WORD 6789
            WORD 5
            ;USER4
            WORD 12435
            WORD 1256
            WORD 12
            ;USER5
            WORD 32345
            WORD 1111
            WORD 3
            ;USER6
            WORD 12121
            WORD 2121
            WORD 9
            ;USER7
            WORD 33333
            WORD 9786
            WORD 1
            

;----------------------------------;
;--------Início do Programa--------;
;----------------------------------;

PLACE 0000H
INICIO:                 ;Redireciona o PC para o local indicado para iniciar o programa, pois o mesmo começa em 0000H
    MOV R0, Principio
    JMP R0

PLACE 5000H
Principio:                  ;Princípio do programa
    MOV SP,Stack_Pointer
    CALL Limpa_Display      ;Coloca o display sem pontos mas sem nada escrito (espaços brancos) o que equivale a ecrã desligado
    CALL Limpa_perifericos  ;Guarda endereço da Stack e limpa os periféricos e o display
    MOV R0 , ON_OFF         ;Guarda o endereço do periférico de entrada do botão on/off

Liga:
    MOVB R1 , [R0]          ;Verifica se o botão de on foi acionada, se não for fica constanetemente preso neste ciclo até o mesmo alterar para 1
    CMP R1 , 1
    JNE Liga                ;Se on=1 salra para verificação de serviço
;----------------------------------;
;--------Verifica baterias---------;
;----------------------------------;
Verifica_Servico:
    MOV R10 , Carga_Carro       ;Após uma operação de carregamento coloca o periférico da bateria do carro a 0, simulando a disconexão do mesmo 
    MOV R9 , 0
    MOV [R10] , R9
    MOV R2 , Bateria_normal     ;Guarda os endereços das baterias para posteriormente aceder ao valor das suas cargas
    MOV R3 , Bateria_rapido
    MOV R4 , Bateria_Srapido
    MOV R2 , [R2]               ;Acede ao valor de cada bateria
    MOV R3 , [R3]
    MOV R4 , [R4]
    MOV R6 , 20                 ;Guarda os valores mínimos de bateria para cada carregamento para verificar se o posto está ou não em serviço
    MOV R7 , 44
    MOV R8 , 55
    CMP R2,R6
    JGT operacional             ;Aqui basta uma das baterias ter mais do mínimo de carga para o posto estar operacional (se alguma for maior salta para operacional)
    CMP R3,R7
    JGT operacional
    CMP R4,R8
    JGT operacional
;----------------------------------;
;-----Máquina não operacional------;
;--Aguarda Admin carregar baterias-;
;----------------------------------;
Not_operacional:                            ;Se nenhuma bateria tiver o mínimo de carga o posto fica fora de serviço
    MOV R2 , Menu_Estado_nao_Operacional    ;Display não operacional
    CALL Mostra_display
    CALL Limpa_perifericos
    MOV R0 , Conexao_admin                  ;Guarda o endereço do periférico de entrada da conexão e password do admin
    MOV R1 , Pass_admin
;----------------------------------;
;--------Lê conexão Admin----------;
;----------------------------------;
Le_Admin:
    MOVB R6 , [R0]                      ;Verfica se a conexão do admin se sucede
    CMP R6 , 0
    JEQ Le_Admin
    CMP R6, Admin_conect
    JEQ rotina_admin_connect            ;Se a conexão se suceder, isto é R6=1 então salta para a verificação de password caso contrário permanece no menu fora de serviço
    JMP Le_Admin

rotina_admin_connect:
    MOV R3 , [R1]
    MOV R4 , Admin
    MOV R5 , [R4]                   ;Verfica se a pass do admin é introduzida e se é igual à guardada em memória
    CMP R3 , 0
    JEQ rotina_admin_connect        ;Se não for inserida mantém menu de fora de serviço e aguarda a sua introdução
    CMP R3, R5
    JEQ mostra_menu_admin             ;Se for introduzida e não for igual à password guardada em memória aguarda nova pass
    JMP rotina_admin_connect

mostra_menu_admin:    
    MOV R2 , Menu_Admin
    CALL Mostra_display
    CALL Limpa_perifericos          ;Se password coincidir entra no display de ADMIN/Baterias carregadas
    MOV R0 , OK
    MOV R1 , Bateria_normal
    MOV R2 , Bateria_rapido 
    MOV R3 , Bateria_Srapido
    MOV R4 , 300
    MOV [R1] , R4                   ;Carrega cada uma das baterias com 300KW(R4)
    MOV [R2] , R4
    MOV [R3] , R4

Le_admin_ok:
    MOVB R1 , [R0]
    CMP R1 , 0                      ;Altera valores de energia nas baterias, adiciona 300KW a cada uma
    JEQ Le_admin_ok                 ;Aguarda o ok para voltar à verificação de seviço
    CMP R1, 1
    JEQ Verifica_Servico
    JMP Le_admin_ok
;----------------------------------;
;--------Máquina operacional-------;
;----------------------------------;
operacional:
    MOV R2 , Menu_Operacional        ;Se estiver operacional apresenta esse mesmo menu e aguarda o OK do utilizador para saltar para o menu de ID
    CALL Mostra_display
    CALL Limpa_perifericos
    MOV R0 , OK
Le_operacional_ok:

    MOVB R1 , [R0]
    CMP R1 , 0
    JEQ Le_operacional_ok           ;Aguarda o OK do utilizador
    CMP R1, 1
    JEQ conecta_carro           ;Se o OK for clicado salta para a o display de conexão do veículo ao posto
    JMP Le_operacional_ok
;----------------------------------;
;-----Aguarda conexão do carro-----;
;----------------------------------;
conecta_carro:
    MOV R2 , Menu_conecta_carro        ;Se estiver operacional apresenta este menu e aguarda o input da bateria incial do carro
    CALL Mostra_display
    CALL Limpa_perifericos
    MOV R0 , OK

Le_conecta_ok:
    MOVB R1 , [R0]
    CMP R1 , 0                  ;Após o utilizador ter colocado o input da bateria incial do carro (conexão do carro ao posto), aguarda ok
    JEQ Le_conecta_ok           ;Aguarda o OK do utilizador
    CMP R1, 1
    JEQ Insercao_ID           ;Se o OK for clicado salta para a o display/rotina de inserção de id
    JMP Le_conecta_ok
;----------------------------------;
;----------Inserção de ID----------;
;----------------------------------;
Insercao_ID:
    MOV R2 , Menu_ID
    CALL Mostra_display
    CALL Limpa_perifericos          ;Apresenta display de inserção de ID
    MOV R0 , Cancel                 ;Guarda o endereço do periférico de entrada do botão cancel, ok, e periférico do ID
    MOV R1 , ID_Cartao
    MOV R2 , OK

Verifica_Cancel:
    MOVB R3,[R0]
    CMP R3,0
    JEQ Verifica_ID
    CMP R3,1
    JEQ Verifica_Servico
    JMP Verifica_Cancel             ;Verifica se o utilizador cancelou a operação, e caso se verifique retorna ao menu operacional
;----------------------------------;
;--Verifica IDs da Base de dados---;
;----------------------------------;
Verifica_ID:
    MOV R4,[R1]                     ;R4 = ID introduzido no periférico
    MOV R5 , [R2]                   ;Só verifica o ID na base de dados, quando o utilizador clica no OK
    CMP R5,0
    JEQ Verifica_Cancel             ;Enquanto não for clicado o ok nem introduzido o ID pode sempre cancelar a operação (volta ao verifica_cancel)
    MOV R5, Base_Dados              ;Guarda endereço incial da base de dados onde está guardado o número de utilizadores
    MOV R6,[R5]                     ;R6 = número de utilizadores que vai ser usado como contador para iterar a base de dados
    MOV R7, Base_Dados
    ADD R7,2                        ;O R7 por sua vez irá ser incrementado em 2 em relação ao Endereço inicial da base de dados, obtendo assim o primeiro ID

Ciclo_ID:
    MOV R8, [R7]                    ;R8 = ID da base de dados que está a ser atualizado começando pelo ID guardado no Endereço de memória 60002
    CMP R4, R8                      ;Compara se o ID introduzido no periférico é igual ao ID em análise
    JEQ Display_Password            ;Se for passa para a inserção da password correspondente
    ADD R7, 6                       ;Incrementa o Endereço de memória em 6 valores, de forma a aceder o próximo ID de utilizador guardado
    SUB R6, 1                       ;Decrementa o R6 (numero utilizadores que será usado como iterador)
    CMP R6,0
    JLE ID_invalido                 ;Se R6 for igual ou menor a 0 significa que já iteramos toda a base de dados e nenhum ID correspondeu ao que foi introduzido
    JMP Ciclo_ID                    ;Se R6 > 0, volta a repetir o ciclo (Basicamente um ciclo for para iterar por todos os IDs da base de dados e comparar com o introduzido)
;----------------------------------;
;------ID inválido/inexistente-----;
;----------------------------------;
ID_invalido:
    MOV R2 , Menu_ID_Invalido
    CALL Mostra_display
    CALL Limpa_perifericos          ;Se o ID for inválido mostra o display a informar o mesmo
    MOV R0 , OK

Le_id_invalido_ok:
    MOVB R1 , [R0]
    CMP R1 , 0
    JEQ Le_id_invalido_ok           ;Aguarda o OK do utilizador
    CMP R1, 1
    JEQ Insercao_ID           ;Se o OK for clicado salta para a o display/rotina de inserção de id
    JMP Le_id_invalido_ok
;----------------------------------;
;------ID válido/Lê password-------;
;----------------------------------;
Display_Password:               ;Se o ID foi correspondido com sucesso, salta para esta parte (password)
    MOV R4 , [R7+2]             ;Logo de início é guaradado em R4 a password do utilizador em questão,    
    MOV R10 , [R7+4]            ;e em R10 o seu saldo para ser usado posteriormente.   
    MOV R2 , Menu_Password      ;Recordemos que R7 guarda o último endereço de ID verificado (utilizador atual), e R8 guarda o valor do ID
    CALL Mostra_display
    CALL Limpa_perifericos          ;Mostra display de inserção de password
    MOV R0 , Cancel
    MOV R1 , Password
    MOV R2 , OK

Verifica_Cancel_Password:
    MOVB R3,[R0]                    ;Verifica se o utilizador cancelou a operação, e caso se verifique retorna ao menu operacional
    CMP R3,1
    JEQ volta_servico               ;Devido ao alcance de JEQ não é possivel saltar logo para verifica serviço, por isso salta pata um JMP
;----------------------------------;
;--Verifica password Base de dados-;
;----------------------------------; 
Verifica_Password:
    MOV R6,[R1]                         ;R6 = password introduzida no periférico
    MOV R5,[R2]                         ;Só verifica a password na base de dados, quando o utilizador clica no OK (R5=1)
    CMP R5,0                            ;Enquanto não for clicado o ok nem introduzida a pass pode sempre cancelar a operação (volta ao verifica_cancel)
    JEQ Verifica_Cancel_Password
    CMP R6, R4                          ;Recordemos que R4 = password da base de dados e R6 a pass introduzida, aqui verifica se são iguais
    JEQ Display_carregamento
    MOV R2 , Menu_Password_invalida
    CALL Mostra_display
    CALL Limpa_perifericos          ;Se a password não corresponder, apresenta display de password inválida 
    MOV R0 , OK

Le_pass_invalida_ok:
    MOVB R1 , [R0]
    CMP R1 , 0
    JEQ Le_pass_invalida_ok           ;Aguarda o OK do utilizador
    CMP R1, 1
    JEQ Display_Password           ;Se o OK for clicado salta para a o display/rotina de inserção de password
    JMP Le_pass_invalida_ok

volta_servico:
    JMP Verifica_Servico            ;O alcançe do JMP permite voltar ao verifica_serviço
;-------------------------------------------------------;
;--------ID e password válido / Menu Carregamento-------;
;-------------------------------------------------------;
Display_carregamento:               ;Se a password estiver correta, entra no menu de seleção de Carregamento
    MOV R2 , Menu_Carregamento
    CALL Mostra_display
    CALL Limpa_perifericos
    MOV R0 , opcao

Ler_Opcao_carregamento:
    MOVB R1 , [R0]                      ;Aguarda o input da opção de carregamento escolhida pelo utilizador
    CMP R1 , 0
    JEQ Ler_Opcao_carregamento
    CMP R1, Modo_normal                 ;Para cada tipo de carregamento corresponde uma rotina diferente
    JEQ rotina_carregamento_normal
    CMP R1, Modo_rapido
    JEQ rotina_carregamento_rapido
    CMP R1, Modo_Srapido
    JEQ rotina_carregamento_srapido
    CALL rotina_opcao_invalida          ;Se a opção for inválida chama a função de opção invalida
    JMP Display_carregamento            ;Se a opção for inválida volta ao menu de seleção de carregamento

rotina_carregamento_normal:             ;Opção Modo normal
    MOV R5 , Percent_normal             ;Guarda em R5 a percentagem de bateria fornecida por hora no carregamento normal
    MOV R3 , Bateria_normal;            ;R3 = Endereço do periférico correspondente à bateria deste modo
    MOV R9 , Preco_normal               ;Preço por hora de carregamento normal
    MOV R6 , Carga_normal               ;R6 = kW/h despendidos pela bateria neste carregamento
    MOV R4, [R3]                        ;R4 = Valor de bateria existente
    MOV R2 , 20                         
    CMP R4 , R2                         
    JGT menu_sel_tempo_normal           ;Se a bateria deste modo for superior a 20KW (4KW x 5H) pode ser utilizado e passa ao menu de tempo
    CALL rotina_sem_bateria             ;Caso contrário se não tiver bateria mínima chama a função de falta de bateria
    JMP Display_carregamento            ;Volta ao menu de escolha de carregamento caso não tenha bateria suficiente para despender

rotina_carregamento_rapido:             ;Opção Modo rápido
    MOV R5 , Percent_rapisdo            ;Guarda em R5 a percentagem de bateria fornecida por hora no carregamento rápido
    MOV R3 , Bateria_rapido;            ;R3 = Endereço do periférico correspondente à bateria deste modo
    MOV R9 , Preco_rapido               ;Preço por hora de carregamento rápido
    MOV R6 , Carga_rapido               ;R6 = kW/h despendidos pela bateria neste carregamento
    MOV R4, [R3]                        ;R4 = Valor de bateria existente
    MOV R2 , 44
    CMP R4 , R2
    JGT menu_sel_tempo_rapido           ;Se a bateria deste modo for superior a 44KW (22KW x 2H) pode ser utilizado e passa ao menu de tempo
    CALL rotina_sem_bateria             ;Caso contrário se não tiver bateria mínima chama a função de falta de bateria
    JMP Display_carregamento            ;Volta ao menu de escolha de carregamento caso não tenha bateria suficiente para despender

rotina_carregamento_srapido:            ;Opção Modo super rápido
    MOV R5 , Percent_srapido            ;Guarda em R5 a percentagem de bateria fornecida por hora no carregamento super rápido
    MOV R3 , Bateria_Srapido            ;R3 = Endereço do periférico correspondente à bateria deste modo           
    MOV R9 , Preco_srapido              ;Preço por hora de carregamento super rápido
    MOV R6 , Carga_srapido              ;R6 = kW/h despendidos pela bateria neste carregamento
    MOV R4, [R3]                        ;R4 = Valor de bateria existente
    MOV R2 , 50
    CMP R4 , R2
    JGT menu_sel_tempo_srapido          ;Se a bateria deste modo for superior a 50KW (50KW x 1H) pode ser utilizado e passa ao menu de tempo
    CALL rotina_sem_bateria             ;Caso contrário se não tiver bateria mínima chama a função de falta de bateria
    JMP Display_carregamento            ;Volta ao menu de escolha de carregamento caso não tenha bateria suficiente para despender
;----------------------------------;
;--------Seleções de tempo---------;
;----------------------------------;
menu_sel_tempo_normal:                  ;Para cada tipo de carregamento, corresponde um diferente número de horas disponíveis
    MOV R2 , Menu_Tempo_normal          ;Não faria sentido por exemplo no carregamento super rápido que fornece 100% bateria em uma hora
    CALL Mostra_display                 ;Ter mais uma opção de tempo que não fosse extamente uma hora
    CALL Limpa_perifericos
    MOV R0 , opcao                      ;Neste caso, este é o menu de tempo para o carregamento normal

Ler_Opcao_tempo_normal:
    MOVB R8 , [R0]                      ;Aguarda o input da opção de tempo escolhida pelo utilizador
    CMP R8 , 0
    JEQ Ler_Opcao_tempo_normal
    CMP R8, Uma_hora
    JEQ rotina_verifica_saldo
    CMP R8, Duas_horas
    JEQ rotina_verifica_saldo
    CMP R8, Tres_horas                  ;Importante referir que, tal como temos guardado nos registos, para cada modo dados importantes
    JEQ rotina_verifica_saldo           ;para realizar o processamento do carregamento, aqui a escolha será guardada em R8.
    CMP R8, Quatro_horas                ;Este valor corresponde ao número de horas de carregamento, que será usado para
    JEQ rotina_verifica_saldo           ;calcular o preço total do carregamento, bateria conferida ao carro, e carga a descontar da bateria do posto.
    CMP R8, Cinco_horas                 ;Pois a rotina seguinte de saldo, verifica bateria, etc.. é genérica para todos os modos usando estes dados
    JEQ rotina_verifica_saldo
    CALL rotina_opcao_invalida          ;Se a opção for inválida chama a função de opção invalida
    JMP menu_sel_tempo_normal           ;Se a opção for invalida voltar ao menu de seleção de tempo normal

menu_sel_tempo_rapido:                  ;Menu de seleção de tempo para modo rápido
    MOV R2 , Menu_Tempo_rapido
    CALL Mostra_display
    CALL Limpa_perifericos
    MOV R0 , opcao

Ler_Opcao_tempo_rapido:                 ;Aguarda o input da opção de tempo escolhida pelo utilizador
    MOVB R8 , [R0]
    CMP R8 , 0
    JEQ Ler_Opcao_tempo_rapido          ;Importante referir que, tal como temos guardado nos registos, para cada modo dados importantes
    CMP R8, Uma_hora                    ;para realizar o processamento do carregamento, aqui a escolha será guardada em R8.
    JEQ rotina_verifica_saldo           ;Este valor corresponde ao número de horas de carregamento, que será usado para
    CMP R8, Duas_horas                  ;calcular o preço total do carregamento, bateria conferida ao carro, e carga a descontar da bateria do posto
    JEQ rotina_verifica_saldo           ;Pois a rotina seguinte de saldo, verifica bateria, etc.. é genérica para todos os modos usando estes dados
    CALL rotina_opcao_invalida          ;Se a opção for inválida chama a função de opção invalida
    JMP menu_sel_tempo_rapido           ;Se a opção for invalida voltar ao menu de seleção de tempo rápido

menu_sel_tempo_srapido:                 ;Menu de seleção de tempo para modo super rápido
    MOV R2 , Menu_Tempo_Srapido
    CALL Mostra_display
    CALL Limpa_perifericos
    MOV R0 , opcao

Ler_Opcao_tempo_srapido:                ;Aguarda o input da opção de tempo escolhida pelo utilizador
    MOVB R8 , [R0]                      ;Importante referir que, tal como temos guardado nos registos, para cada modo dados importantes
    CMP R8 , 0                          ;para realizar o processamento do carregamento, aqui a escolha será guardada em R8.
    JEQ Ler_Opcao_tempo_srapido         ;Este valor corresponde ao número de horas de carregamento, que será usado para
    CMP R8, Uma_hora                    ;calcular o preço total do carregamento, bateria conferida ao carro, e carga a descontar da bateria do posto
    JEQ rotina_verifica_saldo           ;Pois a rotina seguinte de saldo, verifica bateria, etc.. é genérica para todos os modos usando estes dados
    CALL rotina_opcao_invalida          ;Se a opção for inválida chama a função de opção invalida
    JMP menu_sel_tempo_srapido          ;Se a opção for invalida voltar ao menu de seleção de tempo rápido
;----------------------------------;
;-----Verifica Saldo utilizador----;
;----------------------------------;
rotina_verifica_saldo:                  ;Como referido anteriormente R9 = preço do modo escolhido à hora e R8 o número de horas escolhidas
    MUL R9 , R8                         ;R9 = preço do modo escolhido à hora x número de horas escolhido
    CMP R10 , R9                        ;R10 = saldo do utilizador
    JLT sem_saldo                       ;Se saldo do utlizador < preço do modo escolhido x numero de horas escolhidas, salta para sem_saldo, caso contrário continua
;----------------------------------------------------------------;
;--Se tiver saldo verifica se ultrapassa carga maxima do carro---;
;----------------------------------------------------------------;
verifica_bateria_carro:                 ;Se tiver saldo suficiente para pagar continua e desta vez verifica se a carga que irá fornecer ultrapassa os 100% do carro
    MUL R5 , R8                         ;Como referido anteriormente R5 = percentagem fornecida por hora pelo carregamento escolhido
    MOV R2 , max_bateria_car            ;Ou seja R5 = percentagem fornecida por hora pelo carregamento escolhido x número de horas. R2 = 100%
    MOV R1, Carga_Carro                 ;Endereço do periférico da carga do carro
    MOV R0 , [R1]                       ;R0 = valor incial da bateria do carro antes de carregar
    ADD R0 , R5                         ;R0 = valor inicial de bateria do carro + valor a ser carregado
    CMP R0, R2
    JGT ultrapassa_bateria              ;Se R0 > 100% salta para menu que informa carregamento excessivo, caso contrário continua
;----------------------------------;
;-----Sucesso no careregamento-----;
;----------------------------------;
SUCESSO:                                ;Se tudo estiver ok, antigimos o menu de sucesso
    MOV R2 , Menu_carregamento_feito
    CALL Mostra_display
    CALL Limpa_perifericos
    MOV R0 , OK

Le_sucesso_ok:
    MOVB R1 , [R0]
    CMP R1 , 0
    JEQ Le_sucesso_ok          ;Aguarda o OK do utilizador
    CMP R1, 1
    JEQ finalizar           ;Se o OK for clicado finaliza carregamento
    JMP Le_sucesso_ok

finalizar:
    MUL R6 , R8             ;R6 = kW/h despendidos pela bateria neste carregamento x número de horas escolhidas
    SUB R4 , R6             ;R4 = bateria deste modo de carregamento - carga despendida pelo posto
    SUB R10 , R9            ;R10 = saldo do utlizador - (preço do modo escolhido à hora x número de horas escolhido) ou seja - preço final
    MOV [R3] , R4           ;Atualiza o nível de bateria disponível para o modo que foi utilizado
    MOV [R7+4] , R10        ;Atualiza saldo do utilizador na BD, relembro que R7 guarda o endereço de ID do utlizador (R7+4 = endereço do saldo do user)
    JMP Verifica_Servico    ;Volta ao início para verificar se ainda existe bateria para se manter em serviço
;----------------------------------;
;-------------SEM SALDO------------;
;----------------------------------;
sem_saldo:
    MOV R2 , Menu_saldo_insuficiente     ;Menu que informa não ter saldo suficiente para efetuar carregamento
    CALL Mostra_display
    CALL Limpa_perifericos
    MOV R0 , OK

Le_sem_saldo_ok:
    MOVB R1 , [R0]
    CMP R1 , 0
    JEQ Le_sem_saldo_ok          ;Aguarda o OK do utilizador
    CMP R1, 1
    JEQ salta_inicio           ;Se o OK for clicado salta para salta_início 
    JMP Le_sem_saldo_ok        ;que por sua vez realiza JMP para o início para verificar se ainda existe bateria para se manter em serviço
salta_inicio:
    JMP Verifica_Servico       ;Este JMP só é utilizado porque o alcance do JEQ não permite retornar ao início do programa, o JMP permite
;----------------------------------;
;--------Ultrapassa bateria--------;
;----------------------------------;
ultrapassa_bateria:                             ;Menu que informa que carga escolhida excede bateria máxima do veículo
    MOV R2 , Menu_carregamento_supera_carga
    CALL Mostra_display
    CALL Limpa_perifericos
    MOV R0 , OK
    MOV R2, Cancel

Le_ultrapassa_bateria_inputs:
    MOVB R1 , [R0]
    MOVB R5 , [R2]
    CMP R1 , 0
    JEQ Le_cancel_deste_ciclo         ;Aguarda o OK ou Cancel do utilizador
    CMP R1, 1
    JEQ SUCESSO
Le_cancel_deste_ciclo:           ;Se o OK for clicado salta para Sucesso e finaliza carregamento
    CMP R5 , 0
    JEQ Le_ultrapassa_bateria_inputs          ;Se o cancel for clicado permite o utilizador escolher um carregamento diferente e mais adequado
    CMP R5, 1
    JEQ salta_display_carregamento      ;Como o alcance do JEQ não permite voltar ao display de carregamento, salta para um JMP
    JMP Le_ultrapassa_bateria_inputs
salta_display_carregamento:
    JMP Display_carregamento            ;Este JMP só é utilizado porque o alcance do JEQ não permite retornar ao display de carregamnto, o JMP permite

;**********************************;
;***********FUNÇÕES****************;
;**********************************;

Limpa_perifericos:              ;Função que basicamente coloca todos os periféricos temporários a 0
    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R3
    PUSH R4
    PUSH R5
    PUSH R6
    PUSH R7
    PUSH R8
    MOV R0, ON_OFF
    MOV R1, opcao
    MOV R2, OK
    MOV R3, Cancel 
    MOV R4, ID_Cartao
    MOV R5, Password
    MOV R6, Conexao_admin
    MOV R7, Pass_admin
    MOV R8, 0
    MOVB [R0],R8
    MOVB [R1],R8
    MOVB [R2],R8
    MOVB [R3],R8
    MOV [R4],R8
    MOV [R5],R8
    MOVB [R6],R8
    MOV [R7],R8
    POP R8
    POP R7
    POP R6
    POP R5
    POP R4
    POP R3
    POP R2
    POP R1
    POP R0
    RET

Limpa_Display:                  ;Função que basicamente coloca o caracter vazio em todo o display criando assim o display desligado
    PUSH R0
    PUSH R1
    PUSH R2
    MOV R0 , Display
    MOV R1, Display_end
    MOV R2, Caracter_Vazio
Ciclo_limpa:
    MOVB [R0], R2
    ADD R0,1
    CMP R0,R1
    JLE Ciclo_limpa
    POP R2
    POP R1
    POP R0
    RET   

Mostra_display:                 ;Função que recebe um registo que indica o endereço de memória que guarda a interface a ser utilizada e imprime o mesmo no display
    PUSH R0
    PUSH R1
    PUSH R3
    MOV R0 , Display
    MOV R1, Display_end
Ciclo:                          ;Enquanto não chega ao display end, copia palavra a palavra da interface a utilizar para o display
    MOV R3, [R2]
    MOV [R0], R3
    ADD R2,2
    ADD R0,2
    CMP R0,R1
    JLE Ciclo
    POP R3
    POP R1
    POP R0
    RET

rotina_opcao_invalida:              ;Função genérica de opção inválida que basicamente apresenta esse mesmo display e aguarda ok do utilizador
    PUSH R0
    PUSH R1
    PUSH R2
    MOV R2 , Menu_Opcao_invalida
    CALL Mostra_display
    CALL Limpa_perifericos
    MOV R0 , OK
Le_ok_op_invalida:
    MOVB R1 , [R0]
    CMP R1 , 1
    JNE Le_ok_op_invalida
    POP R2
    POP R1
    POP R0
    RET

rotina_sem_bateria:                 ;Função genérica de carregamento sem bateria que basicamente apresenta esse mesmo display e aguarda ok do utilizador
    PUSH R0
    PUSH R1
    PUSH R2
    MOV R2 , Menu_carregamento_sem_carga
    CALL Mostra_display
    CALL Limpa_perifericos
    MOV R0 , OK
Le_ok_sem_bateria:
    MOVB R1 , [R0]
    CMP R1 , 1
    JNE Le_ok_sem_bateria
    POP R2
    POP R1
    POP R0
    RET
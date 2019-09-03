#!/bin/bash

# script de gerencianemto do servidor

#sudo 
clear
#if [ whoami != "root" ]; then
if [ "$EUID" -ne 0 ]; then

	echo "Voce nao eh ROOT."
exit
fi

clear # Limpa a tela

echo "gestao de Servidor"
echo "------------------"
echo "Escolha as op��es abaixo"
echo
echo "[1] - Fazer backup do sistema"
echo "[2] - Verificar a data/hora atual"
echo "[3] - Quantos usu�rios tem no sistema"
echo "[4] - Quantos usu�rios utilizam a shell bash"
echo "[5] - Mostrar o uso da Memoria"
echo "[6] - Mostrar o uso dos Discos"
read x

case "$x" in
	1)
	   echo
           echo "Executando o Backup"
  # esse script tem que existir, estar na mesma pasta do gestao.sh e s$
  ./backup-sistema.sh 
  echo " "
  ;;
# OBS: dois 'ponto-e-virgula' para fechar a se��o acima

	2)
          echo
          echo "A data de hoje eh:" 
                    date +%d-%m-%Y 

          echo " E a hora:"  
                    date +%H:%M 
 
         ;;
  # executa o comando "date" formatando a sa�da. Se quiser sem formata$

	3)
  echo " "
  qtd_usuarios=`cat /etc/passwd | wc -l`
  echo "Atualmente temos: $qtd_usuarios usuarios criados no sistema."
  echo " "
  ;;

	4)
  echo " "
  qtd_usuarios_bash=`grep bash$ /etc/passwd | wc -l`
  echo "Atualmente temos: $qtd_usuarios_bash usuarios com a shell bash criados no sistema."
  echo " "
  ;;

	5)
  echo " "
  echo "Memoria no maquina: $free"
  free
  echo " "
  ;;

	6)
  echo " "
  echo "Discos no maquina: $df"
  df
  echo " "
  ;;


# fim das opcoes
          * )
   echo
   echo "Opcao Invalida!"
  ;;


esac



#!/bin/bash
#
#João Pedro de Araujo da Silva / RA: 1680482011017
#Lucas Henrique Andrade da Rocha / RA: 1680482011001 

echo 'Selecione uma das opções abaixo:'
options=("1-Inclusão" "2-Modificação" "3-Exclusão" "4-Consulta" "5-Sair")
select opt in "${options[@]}"
do

  	case $opt in
        "1-Inclusão")
        clear
        	#++++++++++++++++++++INCLUSAO NOME++++++++++++++++++++++++++++++++++++++++++
        	
            echo '------------------------------------------'
            echo 'Digite os seguintes dados para a inclusão:'
       	    echo '------------------------------------------'
            	echo 'Digite o nome (Exemplo: José):'
            	read nome
            		if (echo $nome | egrep '[^A-z]' &> /dev/null); then
				echo 'Não é nome!'; exit 1
				else
				echo '|Nome Válido!|'
			fi	
            echo '------------------------------------------'
		
		#++++++++++++++++++++INCLUSAO ENDEREÇO++++++++++++++++++++++++++++++++++++++++++
		
		echo '---------------------------------'
		echo 'Digite o CEP (Exemplo: 09990999):'
		echo '---------------------------------'
		read end
			if (echo $end| egrep '^[0-9]{5}[-][0-9]{3}$' &> /dev/null); then
				echo 'Não é endereço!'; exit 1
				else
				echo '|Endereço válido!|'
			fi	
		echo '---------------------------------'
		 
		#+++++++++++++++++++++INCLUSAO TELEFONE+++++++++++++++++++++++++++++++++++++++++
		
		echo '-------------------------------------------'
		echo 'Digite o telefone (Formato:(DDD)9999-9999):'
		echo '-------------------------------------------'
		read telef
		verTelef='^[(][0-9]{2}[)][0-9]{4}+-[0-9]{4}$'
			if ! [[ $telef =~ $verTelef ]] ; then
   				echo '|Telefone Inválido!|' >&2; exit 1
   				else
   				echo '|Telefone válido|'
			fi
		echo '-------------------------------------------'
		
		#+++++++++++++++++++INCLUSAO EMAIL+++++++++++++++++++++++++++++++++++++++++++
		
		echo '-------------------------------------------'
		echo 'Digite o email (Formato : email@email.com):'
		echo '-------------------------------------------'
		read email
		ref='^([a-zA-Z0-9_-.])+@[0-9a-zA-Z.-]+.[a-z]{2,3}$'
			if ! [[ $email =~ $ref ]] ; then
   				echo "|Email válido!|"
   				else
   				echo "|Email inválido!|" >&2; exit 1
			fi
		echo '-------------------------------------------'
		
		#+++++++++++++++++SAVES+++++++++++++++++++++++++++++++++++++++++++++
		
		sed -i "\$a$nome" /home/lucas/sed/bd.txt
		sed -i "\$a$end" /home/lucas/sed/bd.txt
		sed -i "\$a$telef" /home/lucas/sed/bd.txt
		sed -i "\$a$email" /home/lucas/sed/bd.txt
		sed -i '/^ /d' /home/lucas/sed/bd.txt
		
		#+++++++++++++++++PRINTA A TELA+++++++++++++++++++++++++++++++++++++++++++++
		echo '---------------------------'
		echo 'Confira os dados incluídos:'
		sed -n 'p' bd.txt | more
            	echo '---------------------------'
            	sleep 4
            	clear
            	;;
            	
        "2-Modificação")
        clear
            echo "Modifique os seguintes dados:"
            	#+++++++++++++++++++MODIFICA NOME+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            	echo '----------------------------------'
            	echo "Escreva o nome que deseja alterar:"
            	echo '----------------------------------'
            	read nome1
            		if (echo $nome1 | egrep '[^A-z]' &> /dev/null); then
				echo 'Não é nome!' ; exit 1
				else
				echo '|Nome Válido!|!'
			fi	
            	echo '----------------------------------'
            	echo "Escreva o novo nome:"
            	echo '----------------------------------'
            	read nomeMod
            		if (echo $nomeMod | egrep '[^A-z]' &> /dev/null); then
				echo 'Não é nome!' ; exit 1
				else
				echo '|Nome Válido!|!'
			fi	
		#++++++++++++++++++++MODIFICA ENDERECO++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		echo '---------------------------------'
            	echo "Escreva o CEP que deseja alterar:"
            	echo '---------------------------------'
            	read end1
            		if (echo $end1| egrep '^[0-9]{5}[-][0-9]{3}$' &> /dev/null); then
				echo 'Não é endereço!' ; exit 1
				else
				echo '|Endereço válido!|'
			fi	
            	echo '----------------------------------'
            	echo "Escreva o novo CEP:"
            	echo '----------------------------------'
            	read endMod
            		if (echo $endMod| egrep '^[0-9]{5}[-][0-9]{3}$' &> /dev/null); then
				echo 'Não é endereço!' ; exit 1
				else
				echo '|Endereço válido!|'
			fi	
		#++++++++++++++++++MODIFICA TELEFONE++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		echo '--------------------------------------'
            	echo "Escreva o telefone que deseja alterar:"
            	echo '--------------------------------------'
            	read telef1
            		verTelef='^[(][0-9]{2}[)][0-9]{4}+-[0-9]{4}$'
			if ! [[ $telef1 =~ $verTelef ]] ; then
   				echo '|Telefone Inválido!|' >&2; exit 1
			fi
            	echo '--------------------------------------'
            	echo "Escreva o novo telefone:"
            	echo '--------------------------------------'
            	read telefMod
            		verTelef='^[(][0-9]{2}[)][0-9]{4}+-[0-9]{4}$'
			if ! [[ $telefMod =~ $verTelef ]] ; then
   				echo '|Telefone Inválido!|' >&2; exit 1
			fi	
		#++++++++++++++++MODIFICA EMAIL++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		echo '-----------------------------------'
            	echo "Escreva o email que deseja alterar:"
            	echo '-----------------------------------'
            	read email1
            		ref='^([a-zA-Z0-9_-.])+@[0-9a-zA-Z.-]+.[a-z]{2,3}$'
			if [[ $email1 =~ $ref ]] ; then
   				echo "|Email válido!|"
   				else
   				echo "|Email inválido!|" >&2; exit 1
			fi
            	echo '-----------------------------------'
            	echo "Escreva o novo email:"
            	echo '-----------------------------------'
            	read emailMod
            		ref='^([a-zA-Z0-9_-.])+@[0-9a-zA-Z.-]+.[a-z]{2,3}$'
			if [[ $emailMod =~ $ref ]] ; then
   				echo "deu bom"
   				else
   				echo "error: Nao eh um email" >&2; exit 1
			fi
     
            	#+++++++++++++++++SAVES+++++++++++++++++++++++++++++++++++++++++++++
            	sed -i "s/$nome/$nomeMod/" /home/lucas/sed/bd.txt
            	sed -i "s/$end1/$endMod/" /home/lucas/sed/bd.txt
            	sed -i "s/$telef1/$telefMod/" /home/lucas/sed/bd.txt
            	sed -i "s/$email1/$emailMod/" /home/lucas/sed/bd.txt
            	
            	#+++++++++++++++++PRINTA A TELA+++++++++++++++++++++++++++++++++++++++++++++
            	echo '-----------------------------'
            	echo "Confira os dados modificados:"
            	echo '-----------------------------'
            	sed -n 'p' bd.txt | more
            	sleep 4
            	clear
            	;;
            	
        "3-Exclusão")
        
        #+++++++++++++++++EXCLUI DADOS CADASTRADOS+++++++++++++++++++++++++++++++++++++++++
        clear
        	echo '---------------------------------------------'
        	echo 'Selecione os seguintes dados para a exclusão:'
        	echo '---------------------------------------------'
		options=("1-Nomes" "2-Endereços" "3-Telefones" "4-Emails" "5-Sair")
		select opt in "${options[@]}"
		do	
			case $opt in
			"1-Nomes")
			#++++++++++++++VALIDAÇAO EXCLUSAO NOMES+++++++++++++++++++++++++++
				select i in  EXCLUIR MANTER
				do
					case  "$i" in
					"EXCLUIR")
					      echo '-------------------------------------'
					      sed -n  '/[[:upper:]]/p' bd.txt
				              sed -i  '/[[:upper:]]/d' bd.txt
				              echo '-------------------------------------'
				              echo 'Os dados foram excluídos com sucesso!'
				              echo '-------------------------------------'
				              exit 1
					      ;;
					"MANTER")
					      echo "Os dados não foram excluídos!"
					      exit 1
					      ;;
					*)
					      echo "Opção Inválida!"
					      exit 1
					      ;;
					esac
				done
			;;
			"2-Endereços")
			#++++++++++++++VALIDAÇAO EXCLUSAO ENDEREÇOS+++++++++++++++++++++++++++
				select i in  EXCLUIR MANTER
				do
					case  "$i" in
					"EXCLUIR")
					      echo '-------------------------------------'
				              sed -n  '/^0/p' bd.txt
				              sed -i  '/^0/d' bd.txt
				              echo '-------------------------------------'
				              echo 'Os dados foram excluídos com sucesso!'
				              echo '-------------------------------------'
				              exit 1
					      ;;
					"MANTER")
					      echo "Os dados não foram excluídos!"
					      exit 1
					      ;;
					*)
					      echo "Opção Inválida!"
					      exit 1
					      ;;
					esac
				done
			;;
			"3-Telefones")
			#++++++++++++++VALIDAÇAO EXCLUSAO TELEFONES+++++++++++++++++++++++++++
				select i in  EXCLUIR MANTER
				do
					case  "$i" in
					"EXCLUIR")
					      echo '-------------------------------------'
					      sed -n  '/^(/p' bd.txt
					      sed -i  '/^(/d' bd.txt
					      echo '-------------------------------------'
					      echo 'Os dados foram excluídos com sucesso!'
                                              echo '-------------------------------------'
                                              exit 1
					      ;;
					"MANTER")
					      echo "Os dados não foram excluídos!"
					      exit 1
					      ;;
					*)
					      echo "Opção Inválida!"
					      exit 1
					      ;;
					esac
				done
			;;
			"4-Emails")
			#++++++++++++++VALIDAÇAO EXCLUSAO EMAILS+++++++++++++++++++++++++++
				select i in  EXCLUIR MANTER
				do
					case  "$i" in
					"EXCLUIR")
					      echo '-------------------------------------'
					      sed -n  '/@/p' bd.txt
					      sed -i  '/@/d' bd.txt
					      echo '-------------------------------------'
					      echo 'Os dados foram excluídos com sucesso!'
					      echo '-------------------------------------'
					      exit 1
					      ;;
					"MANTER")
					      echo "Os dados não foram excluídos!"
					      exit 1
					      ;;
					*)
					      echo "Opção Inválida!"
					      exit 1
					      ;;
					esac
				done
			;;
			"5-Sair")
		  	    clear
           		    break
                            ;;
			
		*) "Opção Inválida" ;;
	 	esac
	done
            ;;
            	
        "4-Consulta")
      		#+++++++++++++++++CONSULTA DADOS CADASTRADOS+++++++++++++++++++++++++++++++++++++++++
        clear
        	echo '-------------------------------------------------------'
        	echo 'Selecione os seguintes dados desejados para a consulta:'
        	echo '-------------------------------------------------------'
		options=("1-Nomes" "2-Endereços" "3-Telefones" "4-Emails" "5-Sair")
		select opt in "${options[@]}"
		do	
			case $opt in
			"1-Nomes")
				echo '----------------------------------'
				sed -n  '/[[:upper:]]/p' bd.txt
				echo '----------------------------------'
			;;
			"2-Endereços")
				echo '----------------------------------'
				sed -n  '/^0/p' bd.txt
				echo '----------------------------------'
			;;
			"3-Telefones")
				echo '----------------------------------'
				sed -n  '/^(/p' bd.txt
				echo '----------------------------------'
			;;
			"4-Emails")
				echo '----------------------------------'
				sed -n  '/@/p' bd.txt
				echo '----------------------------------'
			;;
			"5-Sair")
		  	    clear
           		    break
                            ;;
			
		*) "Opção Inválida" ;;
	 	esac
	done
            ;;
        "5-Sair")
            break
            ;;
        *) echo "Opção inválida!";;
    esac

done

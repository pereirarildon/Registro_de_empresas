require_relative 'Company.rb'
require_relative 'IndividualCompany.rb'
require_relative 'LimitedPartnership.rb'
require_relative 'EIRELI.rb'
require_relative 'Corporation.rb'

INSERT = 1
ANALYZE = 2
REGISTER = 3
LIST = 4
EXIT = 5

companies = []
protocol = 0

 	system("clear")
 	puts "###########################################"
	puts "##### SISTEMA DE REGISTRO DE EMPRESAS #####"
	puts "###########################################"

 loop do

 	puts "# 1- Inserir Processo"
 	puts "# 2- Julgar Processo"
 	puts "# 3- Cadastrar Empresa"
 	puts "# 4- Consultar Empresa"
 	puts "# 5- Sair"

 	menu_choice = gets.to_i
 	break if menu_choice == EXIT

 	if menu_choice == INSERT
 		system("clear")
 		puts "# 1- Novo Processo"
 		puts "# 2- Reentrada de Processo Ratificado"
 		sub_insert = gets.to_i
 		
 		if sub_insert == 1

 		puts "# Digite o nome da Empresa:"
 			company_name = gets
 		puts "# Escolha o tipo de Empresa:"
 			puts "# 1- Empresa Individual (EI)"
 			puts "# 2- Sociedade Limitada (Ltda.)"
 			puts "# 3- Empresa Individual de Responsabilidade Limitada (EIRELI)"
 			puts "# 4- Sociedade Anonima (S.A)"

 			type_choice = gets.to_i

 			if type_choice == 1
 				puts "# Digite o nome do Titular: "
 				
 				companies[protocol] = IndividualCompany.new()
 				companies[protocol].holder = gets

 				puts "# Digite a Atividade Empresarial: "
 				companies[protocol].activity = gets

 				companies[protocol].activity = company_name
 				companies[protocol].name = company_name
 				companies[protocol].id = protocol
 				companies[protocol].status = "Aguardando Análise"
 				companies[protocol].type = 1
 				protocol += 1
 			

 			elsif type_choice == 2
 				companies[protocol] = LimitedPartnership.new()
 				puts "# Quantos Sócios a Empresa terá?"
 				nPartners = gets.to_i
 				
 				for i in 0...nPartners
 					puts "# Digite o nome do Sócio #{i+1}"
 					companies[protocol].partners[i] = gets
 				end
 				puts "# Digite a Atividade Empresarial: "
 				companies[protocol].activity = gets

 				companies[protocol].name = company_name
 				companies[protocol].id = protocol
 				companies[protocol].status = "Aguardando Análise"
 				companies[protocol].type = 2

 				protocol += 1
 			

 			elsif type_choice == 3
 				puts "# Digite o nome do Titular: "
 				companies[protocol] = EIRELI.new()
 				companies[protocol].holder = gets
 				puts "# Digite a Atividade Empresarial: "
 				companies[protocol].activity = gets
 				companies[protocol].name = company_name
 				companies[protocol].id = protocol
 				companies[protocol].status = "Aguardando Análise"
 				companies[protocol].type = 3
 				protocol += 1
 			

 			elsif type_choice == 4
 				companies[protocol] = LimitedPartnership.new()
 				puts "# Quantos Sócios a Empresa terá?"
 				nPartners = gets.to_i
 				
 				for i in 0...nPartners
 					puts "# Digite o nome do Sócio #{i+1}"
 					companies[protocol].partners[i] = gets
 				end
 				puts "# Digite a Atividade Empresarial: "
 				companies[protocol].activity = gets

 				companies[protocol].name = company_name
 				companies[protocol].id = protocol
 				companies[protocol].status = "Aguardando Análise"
 				companies[protocol].type = 4

 				protocol += 1
 			end
 		end
 		if sub_insert == 2
 			puts "# Digite o número do Protocolo"
 			reenter = gets.to_i
 			companies[reenter-1].status = "Aguardando Análise"
 		end
 			
 	end	

 	if menu_choice == ANALYZE
 		system("clear")


 	end

 	if menu_choice == LIST && protocol > 0
  		system("clear")
 		puts "# Digite o número do Protocolo: "
 		print "2014/"
 		consult_number = gets.to_i

 			puts "________________"
 			puts "Identificador: 2014/#{protocol}"
 			puts "Empresa: #{companies[consult_number-1].name.to_s}"
 			puts "Atividade: #{companies[consult_number-1].activity.to_s}"
 			puts "Situação: #{companies[consult_number-1].status.to_s}"

 			if companies[consult_number-1].type == 1
 				puts "Tipo: Empresa Individual (EI)"
 				puts "Titular: #{companies[consult_number-1].holder.to_s}"
	 		elsif companies[consult_number-1].type == 2
	 			count = 0
	 			puts "Tipo: Sociedade Limitada (Ltda.)"
	 			companies[consult_number-1].partners.each do |part|
	 				puts "Sócio #{count+1}: #{part.to_s}"
	 				count += 1
	 			end
	 		elsif companies[consult_number-1].type == 3
 				puts "Tipo: Empresa Individual de Responsabilidade Limitada (EIRELI)"
 				puts "Titular: #{companies[consult_number-1].holder.to_s}"
 			elsif companies[consult_number-1].type == 4
	 			count = 0
	 			puts "Tipo: Sociedade Anonima (S.A)"
	 			companies[consult_number-1].partners.each do |part|
	 				puts "Sócio #{count+1}: #{part.to_s}"
	 				count += 1
	 			end 	 						
	 		end	
 	elsif menu_choice == LIST && protocol == 0
 		puts "Ainda não há Empresas na Base de Dados!"		
 	end
 end
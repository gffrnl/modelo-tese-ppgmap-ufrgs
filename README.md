# Modelo para a elaboração de teses e dissertações do PPGMap-UFRGS

Este é um modelo LaTeX para a elaboração de teses e dissertações baseado na classe PPGMAp.cls (Classe base: report.cls).

O texto aqui escrito também está contido e melhor detalhado como comentários em [main.tex](https://github.com/KehlRafael/modelo-PPGMap/blob/main/main.tex).

## Créditos
 Autor: Guilherme F. Fornel (guilherme.fornel@ufrgs.br).
 
 Se encontrar bugs, envie um e-mail relatando.

## Pacotes nativos da classe PPGMAp.cls (nao precisam ser adicionados pelo usuario)	
 - inputenc (utf8 encoding)
 - fontenc  (T1 encoding)
 - babel    (default: brazil - english, portuguese, french, spanish, german, russian)
 - etoolbox
 - nomencl  (intoc option)
 - lipsum
 - atbegshi
 - calc

##	Sobre a compilacao
 É recomendável a utilização da biblioteca/compilador TeX Live 2016 FULL (este modelo foi compilado para teste com a versao 2016.20170123-5).
 
 Para a instalacao do TeX Live em so's derivados do linux Ubuntu utilizar:
 ```
 sudo apt-get install texlive-full 
 ```
 
 ### Compilando o modelo via terminal do linux
 Para a compilacao via terminal utilizar as seguintes linhas de comando:
 ```
 pdflatex nome_do_arquivo_principal
 bibtex nome_do_arquivo_principal   < opcional >
 makeindex -s nomencl.ist -t nome_do_arquivo_principal.nlg -o nome_do_arquivo_principal.nls nome_do_arquivo_principal.nlo < para lista de simbolos >
 pdflatex nome_do_arquivo_principal
 pdflatex nome_do_arquivo_principal
 ```

 No caso deste modelo:
 ```
 pdflatex main
 bibtex main   < opcional >
 makeindex -s nomencl.ist -t main.nlg -o main.nls main.nlo < para lista de simbolos >
 pdflatex main
 pdflatex main		
 ```
 ### Utilizando a ide TeXstudio:
 Usuarios do TeXstudio devem configurar a ide para gerar a lista de simbolos acessando
 ```
 Opções -> Configurar TeXstudio -> Compilação -> Comandos do usuário -> Adicionar
 ```
 
 Deve ser adicionado o comando Make Nomenclature com:
 - Nome do comando:  user0:Make Nomenclature
 - Linha de comando: makeindex -s nomencl.ist -t %.nlg -o %.nls %.nlo
 
 Para a compilacao utilizar:
 ```
 Ferramentas -> Comandos -> PDFLaTeX
 Ferramentas -> Comandos -> BibteX              <opcional>
 Ferramentas -> Usuario  -> Make Nomenclature   <para lista de simbolos>
 Ferramentas -> Comandos -> PDFLaTeX
 Ferramentas -> Comandos -> PDFLaTeX
 ```

 ## Opcoes da classe PPGMAp.cls
 Por padrão a classe está configurada para tese de doutorado com texto em português, folha A4,
 tamanho de fonte 12pt e configuração de impressão em ambos os lados da folha.
 Ao usuário, porém, estão disponíveis algumas opções de configuração:

 - qualification : opção para texto de qualificação
 - masters : dissertação de mestrado
 - english : texto em inglês
 - oneside : opção para configuração de impressão em apenas um lado da folha (ficha catalográfica também)
 - print : opção de versão final do texto para impressão em apenas um lado da folha,
 com excessão da primeira página (folha de rosto e ficha catalográfica). Para tal são inseridas páginas em
 branco no documento, e o usuário deve selecionar no aplicativo de impressão do sistema operacional a opção `IMPRIMIR EM AMBOS OS LADOS`
 
 Demais opcoes da classe base report.cls NAO sao repassadas a classe PPGMAp.cls

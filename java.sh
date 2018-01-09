#!/bin/sh
echo "------------------------------------------------------------------"
echo "Script de instação do java (JDK e JRE) da oracle no debian"
echo "Desenvolvido por Juin | github.com/juin | twitter: @juin_lima"
echo "Versão 0.1"
echo "------------------------------------------------------------------"

echo -n "Digite o arquivo baixado do site da Oracle com diretorio completo: "
read arquivo

if test -f "$arquivo"
then
 tar zxf $arquivo
 echo "Essas sao as pastas encontradas no diretorio de instalacao. Qual delas deseja usar. (Informe o nome completo da pasta)"
 ls -l
 echo -n "Digite a pasta desejada: "
 read dir_install
 if test -d "$dir_install"
 then
  echo "Iniciando instalação do ORACLE JAVA"

  update-alternatives --install "/usr/bin/java" "java" "$dir_install/bin/java" 1
  update-alternatives --install "/usr/bin/javac" "javac" "$dir_install/bin/javac" 1
  update-alternatives --install "/usr/lib/mozilla/plugins/libjavaplugin.so" "mozilla-javaplugin.so" "$dir_install/jre/lib/amd64/libnpjp2.so" 1
  update-alternatives --install "/usr/bin/idlj" "idlj" "$dir_install/bin/idlj" 1

  echo "Atualizando versão do java usada pelo sistema"
  update-alternatives --set java "$dir_install/bin/java"
  update-alternatives --set javac "$dir_install/bin/javac"
  update-alternatives --set mozilla-javaplugin.so "$dir_install/jre/lib/amd64/libnpjp2.so"
  update-alternatives --set idlj "$dir_install/bin/idlj"

  echo "Java, Javac, Plugin Mozilla e idlj atualizados com sucesso."
  java -version
 else
  echo "Diretorio nao encontrado."
 fi
else
echo "$ARQUIVO não existe ou não foi encontrado"
fi






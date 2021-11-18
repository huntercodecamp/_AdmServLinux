# _AdmServLinux
Repositório com Configuração de servidor linux

• Baixar e Instalar Virtual box 

•  Baixar Debian DVD1 iso;
•  criar máquina com 1256 mb 
    ○ hd tipo vdi   
    ○ 25gb HD 
    iniciar  VM  e instalar o Debian DVD1 iso

• Desligar a VM 

• Ir para as configurações da VM na parte de rede e mudar para placa em modo bridge depois no menu a baixo avançado abra a lista suspensa e o nomo promíscuo mudar na lista suspensa para permitir tudo.

• ligar a VM 

• logar na conta 

• abrir terminal e logar como root 

• para configuração de ip estático você deve criar o Arquivo de configuração de rede com nome da interface de rede com extensão .config na pasta /etc/network.interfaces.d/
ex: sudo nano -w /etc/network/interfaces/enp0s3.config

link do exemplo1 aqui no repositório: https://github.com/huntercodecamp/_AdmServLinux/blob/main/etc/network/interfaces.d/enp0s3.config
link do exemplo2 do site oficial do servidor debian: https://servidordebian.org/pt/buster/config/network/static_ip

para conferir se configurou corretamente tente o comando no terminal root# : systemctl restart networking 

se não aparecer nenhum erro está ok. 
Obs: em alguns casos é preciso reiniciar para funcionar. 
então se como o comando não funcionou reinicie e teste no terminal 

• abra o terminal novamente e digite root#: ip -4 a

• verifique se sua interface de rede foi aceita e se está funcionando.

• agora para a configuração ficar mais fácil dependendo da configuração do servidor é recomendado ser instalado primeiro o servidor ssh para poder acessar remotamente en outra máquina com configurações melhores para se trabalhar vendo a documentação.

• no terminal root execute o comando: 

  root#: apt install openssh-server openssh-client -y 
  link do exemplo de configuração da documentação oficial: https://servidordebian.org/pt/buster/config/remote_access/ssh_server
  link do exemplo de configuração no nosso exemplo: https://github.com/huntercodecamp/_AdmServLinux/blob/main/etc/ssh/sshd_config

•  No terminal após a instalação e configuação execute o comando como root: 
  habilite para iniciar o serviço de ssh junto com o sistema com o comando a seguir:
  root#: systemctl enable ssh
  
a partir de agora podemos configurar o servidor de um outro servidor remoto ou outro computador.








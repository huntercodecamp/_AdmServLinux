# _AdmServLinux
Repositório com Configuração de servidor linux



1ª etapa

    
    • Baixar e Instalar Virtual box 

    •  Baixar Debian DVD1 iso;
    •  criar máquina com 1256 mb 
        ○ hd tipo vdi   
        ○ 25gb HD 
        iniciar  VM  e instalar o Debian DVD1 iso

    • Desligar a VM 

    • Ir para as configurações da VM na parte de rede e mudar para placa em modo bridge depois no menu a baixo avançado abra a lista suspensa e o nomo promíscuo mudar na lista suspensa para permitir tudo.

    • ligar a VM 

    
2ª etapa:
    edite o arquivo /etc/apt/sources.list
    
    para editar abra o terminal como root#: 
    
    root#: nano -w /etc/apt/sources.list
    
        deb http://deb.debian.org/debian bullseye main
        deb-src http://deb.debian.org/debian bullseye main

        deb http://deb.debian.org/debian-security/ bullseye-security main
        deb-src http://deb.debian.org/debian-security/ bullseye-security main

        deb http://deb.debian.org/debian bullseye-updates main
        deb-src http://deb.debian.org/debian bullseye-updates main
    
    salvar e sair
    abra o terminal como root e digite o comando 
    root#: apt update -y && apt upgrade -y
    
    
3ª etapa: 

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
    


4ª etapa: 

    • agora para a configuração ficar mais fácil dependendo da configuração do servidor é recomendado ser instalado primeiro o servidor ssh para poder acessar remotamente en outra máquina com configurações melhores para se trabalhar vendo a documentação.

    • no terminal root execute o comando: 

      root#: apt install openssh-server openssh-client -y 
      link do exemplo de configuração da documentação oficial: https://servidordebian.org/pt/buster/config/remote_access/ssh_server
      link do exemplo de configuração no nosso exemplo: https://github.com/huntercodecamp/_AdmServLinux/blob/main/etc/ssh/sshd_config

    •  No terminal após a instalação e configuação execute o comando como root: 
      habilite para iniciar o serviço de ssh junto com o sistema com o comando a seguir:
      root#: systemctl enable ssh

    OBS: a partir de agora podemos configurar o servidor de um outro servidor remoto, outro computador dentro da rede ou o mesmo computador pelo putty do windows.



5ª etapa: Fazer servidor funcionar como cache de DNS serguir a etapa 1,2,3.

    ex: cache DNS toda a configuração passo a passo: Ex1 site: https://servidordebian.org/pt/buster/intranet/dns/cache
   
   •  para fazer isso abra o terminal como root
    
        root#: sudo apt install bind9 bind9-doc dnsutils -y
        após a instalação devemos 
        
        configurar o ficheiro: /etc/bind/named.conf.options
        abra o terminal como root e execute o comando
        root#: nano -w /etc/bind/named.conf.options
        Ex daqui: https://github.com/huntercodecamp/_AdmServLinux/blob/main/etc/bind/named.conf.options
        salvar e sair
        executar no terminal como root: 
        root#: named-checkconf

        OBS: se deu tudo certo nenhum erro irá aparecer no terminal

        configurar o ficheiro /etc/resolv.conf
        abra o terminal como root e execute o comando 
        root#: nano -w /etc/resolv.conf

        ex daqui: https://github.com/huntercodecamp/_AdmServLinux/blob/main/etc/resolv.conf
        salvar e sair 
        executar no terminal como root 
        root#: systemctl restart bind9

        para testar agora o servidor deve conseguir entrar o ip de qualquer sitio da internet como o comando nslookup
        execute no terminal como root
        root#: nslookup www.debian.org
            
            
    6ª Etapa: para fazer o DNS local da etapa 1 a 4 deve ter sido concluída.
    
        Ex o site Oficial de todos os carquivo com passo a passo: https://servidordebian.org/pt/buster/intranet/dns/server
        
        abra o terminal como root e edite o arquivo /etc/bind/named.conf.local:
        root#: nano -w /etc/bind/named.conf.local
        
        ex daqui: https://github.com/huntercodecamp/_AdmServLinux/blob/main/etc/bind/named.conf.local
        salve e sair
        
        no terminal como root execute o comando 
        root#: sudo named-checkconf
        
        se não aparecer nenhum erro está ok por enquanto
        agora deve ser criado um arquivo dentro da pasta bind com o nome do arquivo que foi colocado no arquivo anterior
        no exemplo foi usado:
        
            zone "l1professor.lan" {
                type master;
                file "/etc/bind/db.l1professor.lan";
            };
            zone "30.15.168.192.in-addr.arpa" {
                type master;
                file "/etc/bind/db.88.0.16.172";
            };
            
        temos que criar os arquivos /etc/bind/db.88.0.16.172 e /etc/bind/db.l1professor.lan
        no caso você deverá editar como deve ser no seu servidor então os nomes deverão estar diferentes os arquivos devem estar o nome que você inventou;
        
        execute o comando no terminal root 
        root#: nano -w /etc/bind/db.l1professor.lan
        edite como no exemplo: https://github.com/huntercodecamp/_AdmServLinux/blob/main/etc/bind/db.l1professor.lan
        salvar e sair
        
        agora edite o próximo arquivo: /etc/bind/db.88.0.16.172
        edite como no exemplo https://github.com/huntercodecamp/_AdmServLinux/blob/main/etc/bind/db.88.0.16.172
        abra o terminal root: 
        root#: nano -w /etc/bind/db.88.0.16.172
        
        
        
    
        
    
    
    









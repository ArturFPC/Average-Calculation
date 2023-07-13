!  Console1.f90 
!
!  FUNCTIONS:
!  Console1 - Entry point of console application.
!  Autores: Artur Francisco Pereira Carvalho e Yanky Jhonata 

!****************************************************************************
!
!  PROGRAM: Console1
!
!  PURPOSE:  Entry point for the console application.
!
!****************************************************************************

    program Console1

    implicit none
      integer :: n, i, status
      real :: soma, media 
      integer, parameter :: max_numeros = 100
      real, dimension(max_numeros) :: numeros

      ! Abrir o arquivo de entrada
      open(unit=5, file='input.txt', status='old', action='read', iostat=n)
      if (n /= 0) then
        write(*, *) 'Erro ao abrir o arquivo de entrada.'
        stop
      end if

      ! Abrir o arquivo de saída
      open(unit=6, file='output.txt', status='unknown', action='write', iostat=n)
      if (n /= 0) then
        write(*, *) 'Erro ao abrir o arquivo de saída.'
        stop
      end if

      soma = 0.0
      i=1
      ! Ler os números a partir do arquivo de entrada e calcular a soma
      do
        read(5, *,iostat = status) numeros(i)
        if (status /= 0) then
          exit
        endif
        soma = soma + numeros(i)
        i = i+1
      end do
      media = soma / (i-1)
      print *,media
      ! Escrever a média no arquivo de saída
      write(6, *) 'A média é:', media

      ! Fechar os arquivos
      close(5)
      close(6)

    end program Console1

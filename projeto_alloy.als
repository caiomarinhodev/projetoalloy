/*
*Importando a library ordering. Em seguida, aplicando à assinatura Time.
*/
open util/ordering [Time]

/**ASSINATURAS*/

/*
*Assinatura para simular tempo
*/
sig Time{}
/*
*
*/
one sig SistemaHotel {
	hospedes: set Hospede,
	reservas: set Reserva
}

abstract sig Hospede{}
sig Adulto, Crianca extends Hospede{}

abstract sig StatusDaReserva{}
one sig Realizada, Cancelada extends StatusDaReserva{}

abstract sig Quarto{}
sig Duplo, Triplo extends Quarto{}

abstract sig Alimentacao{}
lone sig CafeManha, MeiaPensao, PensaoCompleta extends Alimentacao{}

sig Reserva{
 	status: StatusDaReserva -> Time,
	tipoQuarto: Quarto -> Time,
	alimentacao: Alimentacao -> Time
}


/**RUN */
pred show[]{}
/*
* Com os limites superiores abaixo tornou-se fácil de se observar os comportamentos rapidamente.
* Sinta-se livre para alterar isso.
*/
run show

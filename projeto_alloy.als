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
*Um determinado hotel de praia possui hóspedes e reservas
*/
one sig SistemaHotel {
	reservas: set Reserva
}


// Até uma criança em quarto duplo (duas, para quarto triplo) é permitida gratuitamente
abstract sig Hospede{
}
one sig Adulto, Crianca extends Hospede{
}

abstract sig StatusDaReserva{}
lone sig Realizada, Cancelada extends StatusDaReserva{}

// Existem quartos duplos (onde podem se hospedar também uma só pessoa) e triplos
abstract sig Quarto{}
sig QuartoDuplo, QuartoTriplo extends Quarto{
}

// Cada hospedagem é feita em um regime de alimentação: café da amanhã apenas,
// meia pensão (inclui jantar) e pensão completa (todas as refeições)
abstract sig Alimentacao{}
lone sig CafeManha, MeiaPensao, PensaoCompleta extends Alimentacao{}

sig Reserva{
	hospedes: set Hospede,
 	statusReserva: StatusDaReserva -> Time,
	tipoQuarto: one Quarto,
	alimentacao: one Alimentacao
}


// PREDICADOS

// Existem quartos duplos (onde podem se hospedar também uma só pessoa) e triplos
pred quartoDuploTemMax2hospedes[] {
	all r: Reserva |
	r.tipoQuarto = QuartoDuplo
	implies 
		#r.hospedes <= 2
}

pred quartoTriploTemMax3Hospedes[] {
	all r: Reserva |
	r.tipoQuarto = QuartoDuplo
	implies 
		#r.hospedes <= 3
}
// Até uma criança em quarto duplo (duas, para quarto triplo) é permitida gratuitamente

pred duploTemMax1Crianca[]{
	all r: Reserva |
	r.hospedes = Crianca
	implies 
		#r.hospedes <= 1
}

pred triploTemMax2Crianca[]{
	all r: Reserva |
	r.hospedes = Crianca
	implies 
		#r.hospedes <= 2
}
//  Reservas podem ser realizadas e depois canceladas, 
// já definindo de antemão o regime de alimentação desejado e o tipo de quarto


//  A reserva só pode ser feita com um cartão de crédito
// que será cobrado caso o hóspede não apareça no dia da reserva

// Reservas de mais de 3 dias têm que ser obrigatoriamente meia-pensão ou pensão completa



/** 1: Especificação do Sistema*/
/*
* Observe que tentamos deixar o codigo o mais claro possivel,
* a fim de evitar a necessidade de comentarios muito extensos e profundos.
* Afinal, o melhor comentario eh o proprio codigo.
*/
fact EspecificaçãoDoSistema {

	quartoDuploTemMax2hospedes
	quartoTriploTemMax3Hospedes

}


/**RUN */
pred show[]{}
/*
* Com os limites superiores abaixo tornou-se fácil de se observar os comportamentos rapidamente.
* Sinta-se livre para alterar isso.
*/
run show

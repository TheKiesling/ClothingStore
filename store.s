/* --------------------------------------------------------------------------------------
* #      #    #######    ########   #######   #          #######   ##      #    #########
* #     #        #       #          #         #             #      # #     #    #
* #    #         #       #          #         #             #      #  #    #    #
* ####           #       #####      #######   #             #      #   #   #    #    ####
* #    #         #       #                #   #             #      #    #  #    #       #
* #     #        #       #                #   #             #      #     # #    #       #
* #      #    ########   ########   #######   ########   #######   #      ##    #########
* 
* UNIVERSIDAD DEL VALLE DE GUATEMALA 
* Organización de computadoras y Assembler
* Ciclo 1 - 2022
* -------------------------------
* Emily Elvia Perez Alarcón 21385
* Jose Pablo Kiesling Lange 21581
* -------------------------------
* store.s
* Simulacion de una tienda que guarda la cantidad 
* de playeras según su talla
* -------------------------------------------------
* R4: Playera 1
* R5: Playera 2
* R6: Playera 3
* R7: Playera 4
* R8: Playera 5
 -------------------------------------------------------------------------------------- */

/* --------------------------------------- TEXT --------------------------------------- */
.text
.align 2
.global main
.type main,%function

main:
	@@ grabar registro de enlace en la pila
	stmfd sp!, {lr}	/* SP = R13 link register */

    @@ Bienvenida al programa
    ldr r0,=mensaje_ingreso
    bl puts

	/* ----------------------------------- ENTRADA ------------------------------------ */
    @@ ingreso de datos
	@@ r0 contiene formato de ingreso
	@@ r1 contiene direccion donde almacena dato leido
	@@ r[i] contiene el tipo de la camisa que se ingresa (i empieza en 4 y termina en 8)

    /* --- Playera 1 --- */
	ldr r0,=solicitud
	bl puts
	ldr r0,=entrada
	ldr r1,=a
	bl scanf
	ldr r4,=a
	ldr r0,=entrada
	ldr r1,[r4]
	bl printf

    /* --- Playera 2 --- */
	ldr r0,=solicitud
	bl puts
	ldr r0,=entrada
	ldr r1,=b
	bl scanf
	ldr r5,=b
	ldr r0,=entrada
	ldr r1,[r5]
	bl printf

    /* --- Playera 3 --- */
	ldr r0,=solicitud
	bl puts
	ldr r0,=entrada
	ldr r1,=c
	bl scanf
	ldr r6,=c
	ldr r0,=entrada
	ldr r1,[r6]
	bl printf

    /* --- Playera 4 --- */
	ldr r0,=solicitud
	bl puts
	ldr r0,=entrada
	ldr r1,=d
	bl scanf
	ldr r7,=d
	ldr r0,=entrada
	ldr r1,[r7]
	bl printf

    /* --- Playera 5 --- */
	ldr r0,=solicitud
	bl puts
	ldr r0,=entrada
	ldr r1,=e
	bl scanf
	ldr r8,=e
	ldr r0,=entrada
	ldr r1,[r8]
	bl printf

	@@ r0, r3 <- 0 como senal de no error al sistema operativo
	mov	r3, #0
	mov	r0, r3

	@ colocar registro de enlace para desactivar la pila y retorna al SO
	ldmfd	sp!, {lr}
	bx	lr

/* --------------------------------------- DATA --------------------------------------- */
.data
.align 2

/*-- Playeras --*/
a: .word 0 
b: .word 0
c: .word 0
d: .word 0
e:.word 0

/*-- Mensajes --*/
entrada:
	.asciz " %d"
mensaje_ingreso: 
    .asciz "Bienvenido a su programa de Tienda"
solicitud:
	.asciz "Ingrese el numero que represente la talla de la playera a ingresar (1: small, 2: medium, 3: large)"

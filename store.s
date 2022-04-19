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
* R4: Playera 1		|		R9: cantidad small
* R5: Playera 2		|		R12: cantidad medium
* R6: Playera 3		|		R11: cantidad large
* R7: Playera 4		|
* R8: Playera 5		|
 -------------------------------------------------------------------------------------- */

/* --------------------------------------- TEXT --------------------------------------- */
.text
.align 2
.global main
.type main,%function

/* ---------------- MAIN ---------------- */ 
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

    /* --- Playera 2 --- */
	ldr r0,=solicitud
	bl puts
	ldr r0,=entrada
	ldr r1,=b
	bl scanf
	ldr r5,=b

    /* --- Playera 3 --- */
	ldr r0,=solicitud
	bl puts
	ldr r0,=entrada
	ldr r1,=c
	bl scanf
	ldr r6,=c

    /* --- Playera 4 --- */
	ldr r0,=solicitud
	bl puts
	ldr r0,=entrada
	ldr r1,=d
	bl scanf
	ldr r7,=d

    /* --- Playera 5 --- */
	ldr r0,=solicitud
	bl puts
	ldr r0,=entrada
	ldr r1,=e
	bl scanf
	ldr r8,=e

	@@ guarda en el registro correspondiente el valor apuntado a cada valor de la playera
	ldr r4,[r4]
	ldr r5,[r5]
	ldr r6,[r6]
	ldr r7,[r7]
	ldr r8,[r8]

/* ---------------- ANALISIS PLAYERA 1 ---------------- */ 
analisis_a:
	cmp r4,#1 @@ comparacion para verificar si la playera es small
	beq small_a
	bne analisis_aa
	b analisis_b

small_a:
	add r9,#1 @@ aumenta la cantidad de playeras small
	b analisis_b

analisis_aa:
	cmp r4,#2 @@ comparacion para verificar si la playera es medium
	beq	medium_a
	bne large_a
	b analisis_b

medium_a:
	add r12,#1 @@ aumenta la cantidad de playeras medium
	b analisis_b

large_a:
	add r11,#1 @@ aumenta la cantidad de playeras large
	b analisis_b

/* ---------------- ANALISIS PLAYERA 2 ---------------- */ 
analisis_b:
	cmp r5,#1 @@ comparacion para verificar si la playera es small
	beq small_b
	bne analisis_bb
	b analisis_c

small_b:
	add r9,#1 @@ aumenta la cantidad de playeras small
	b analisis_c

analisis_bb:
	cmp r5,#2 @@ comparacion para verificar si la playera es medium
	beq	medium_b
	bne large_b
	b analisis_c

medium_b:
	add r12,#1 @@ aumenta la cantidad de playeras medium
	b analisis_c

large_b:
	add r11,#1 @@ aumenta la cantidad de playeras large
	b analisis_c

/* ---------------- ANALISIS PLAYERA 3 ---------------- */ 
analisis_c:
	cmp r6,#1 @@ comparacion para verificar si la playera es small
	beq small_c
	bne analisis_cc
	b analisis_d

small_c:
	add r9,#1 @@ aumenta la cantidad de playeras small
	b analisis_d

analisis_cc:
	cmp r6,#2 @@ comparacion para verificar si la playera es medium
	beq	medium_c
	bne large_c
	b analisis_d

medium_c:
	add r12,#1 @@ aumenta la cantidad de playeras medium
	b analisis_d

large_c:
	add r11,#1 @@ aumenta la cantidad de playeras large
	b analisis_d

/* ---------------- ANALISIS PLAYERA 4 ---------------- */
analisis_d:
	cmp r7,#1 @@ comparacion para verificar si la playera es small
	beq small_d
	bne analisis_dd
	b analisis_e

small_d:
	add r9,#1 @@ aumenta la cantidad de playeras small
	b analisis_e

analisis_dd:
	cmp r7,#2 @@ comparacion para verificar si la playera es medium
	beq	medium_d
	bne large_d
	b analisis_e

medium_d:
	add r12,#1 @@ aumenta la cantidad de playeras medium
	b analisis_e

large_d:
	add r11,#1 @@ aumenta la cantidad de playeras large
	b analisis_e

/* ---------------- ANALISIS PLAYERA 5 ---------------- */
analisis_e:
	cmp r8,#1 @@ comparacion para verificar si la playera es small
	beq small_e
	bne analisis_ee
	b print

small_e:
	add r9,#1 @@ aumenta la cantidad de playeras small
	b print

analisis_ee:
	cmp r8,#2 @@ comparacion para verificar si la playera es medium
	beq	medium_e
	bne large_e
	b print

medium_e:
	add r12,#1 @@ aumenta la cantidad de playeras medium
	b print

large_e:
	add r11,#1 @@ aumenta la cantidad de playeras large
	b print

/* ---------------- PRINT ---------------- */
print:
	@@ Muestra todos los datos
	ldr r0,=cantidad_camisas	

	@@ movimiento para asignar los registros la cantidad de playeras 
	mov r1,r9
	mov r2,r12
	mov r3,r11
	bl printf
	b salir

/* ---------------- SALIR ---------------- */
salir:
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
cantidad_camisas:
	.asciz "--- Numero de camisas ---\n - Small: %d \n - Medium: %d \n - Large: %d \n"

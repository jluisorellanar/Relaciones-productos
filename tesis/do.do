cls
clear all

cd "C:\Users\lavic\OneDrive\Desktop\Economia\Tesis cristel\Variables y datos"
use datos.dta


encode country_name, gen(pais)
sort pais year
xtset pais year
gen pop = ln(Populationgrowthannual + 0.05)



*xtreg Y lnyo lnrem lny_rem lnfbkf pop
*xtreg Y lnyo lnrem lny_rem lnfbkf pop, fe 
*estimate store consistentefe 
*xtreg Y lnyo lnrem lny_rem lnfbkf pop, re 
*estimate store eficientere	

*hausman consistentefe ., sigmamore
** se prefiere modelo de efectos aleatorios, p value 0.000 se rechaza Ho

*xtreg Y lnyo lnrem lny_rem lnfbkf pop, re 

* test heterocedasticidad
*xttest0
* tiene hetero

* test autocorrelacion
*xtserial Y lnyo lnrem lny_rem lnfbkf pop
* tiene autocorr


* metodo con errores estandar y autoorr
*xtscc Y lnyo lnrem lny_rem lnfbkf pop, re ase

* método con variables instrumentales
xtabond Y lnyo lnrem lny_rem lnfbkf pop, re iv(lnrem Employmentinagricultureof Employmentinagricultureof) twostep robust





    if(hamburguer){
        hamburguer.addEventListener("click",(el)=>{
            document.querySelector('.header').classList.add('showHeader');
        });
    }

    if(closeHamburguer){
        closeHamburguer.addEventListener("click",(el)=>{
            document.querySelector('.header').classList.remove('showHeader');
        });
    }
    if(hosannaH){
        hosannaH.addEventListener("click",()=>{
            document.querySelector('.header').classList.remove('showHeader');
            window.location.href="/";
        });
    }
            

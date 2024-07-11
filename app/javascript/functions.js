const hamburguer=document.querySelector('#hamburguer');
const closeHamburguer=document.querySelector('#closeHamburguer');

hamburguer.addEventListener("click",(el)=>{
    document.querySelector('.header').classList.toggle('showHeader');
});

closeHamburguer.addEventListener("click",(el)=>{
    document.querySelector('.header').classList.remove('showHeader');
});

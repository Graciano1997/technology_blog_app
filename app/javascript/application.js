// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "trix"
import "@rails/actiontext"

const hamburguer=document.querySelector('#hamburguer');
const closeHamburguer=document.querySelector('#closeHamburguer');
const hosannaH=document.querySelector('#hosannaH');
const navLinks=document.querySelectorAll('.linkList li');
const comentArea=document.querySelector('#comentArea');

const contar = document.querySelectorAll(".equipos img").length;
for (let k = 0; k < contar; k++) {
  document
    .querySelectorAll(".equipos img")
    [k].addEventListener("click", atleti);
}

function atleti() {
  const valor = this.getAttribute("id");
  document.querySelector("#sexo").value = valor;
  desactivar();
  this.style.border = "2px solid crimson";
  this.style.backgroundColor = "crimson";
  this.style.marginTop = "10px";
}

function desactivar() {
  for (let k = 0; k < contar; k++) {
    document.querySelectorAll(".equipos img")[k].style = null;
  }
}

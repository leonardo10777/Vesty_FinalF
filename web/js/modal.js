const button = document.querySelector("button");
const modal = document.querySelector("dialog");


button.onclick = function(){
    modal.showModal();
}


button.addEventListener('submit',function(event){
    alert('Compra realizada com sucesso');
})

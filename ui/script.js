$(document).ready(function(){
var sex = 1

  // Listen for NUI Events
  window.addEventListener('message', function(event){
    // Open Skin Creator
    if(event.data.openSkinCreator == true){
      $(".skinCreator").css("display","block");
      $(".rotation").css("display","flex");;
	  Load()
    }
    // Close Skin Creator
    if(event.data.openSkinCreator == false){
      $(".skinCreator").fadeOut(400);
      $(".rotation").fadeOut(400);
    }
	
	function Load(){
//console.log(event.data.hat);
sex = event.data.sex
//console.log(event.data.pants);
//console.log(event.data.sex);
document.getElementById("hat").value = event.data.hat;
document.getElementById("shirt").value = event.data.shirt;
document.getElementById("vest").value = event.data.vest;
document.getElementById("pants").value = event.data.pants;
document.getElementById("mask").value = event.data.mask;
document.getElementById("boots").value = event.data.shoes;
document.getElementById("skirt").value = event.data.dress;
document.getElementById("coat").value = event.data.coat;
document.getElementById("gloves").value = event.data.gloves;
document.getElementById("bandana").value = event.data.bandana;		
document.getElementById("gunbelts").value = event.data.gunbelts;
document.getElementById("belts").value = event.data.belts;
document.getElementById("beltbuckle").value = event.data.buckle;
document.getElementById("offhand").value = event.data.offhand;
document.getElementById("neckties").value = event.data.tie;
document.getElementById("suspenders").value = event.data.suspenders;
document.getElementById("spurs").value = event.data.spurs;
document.getElementById("poncho").value = event.data.poncho;
document.getElementById("eyewear").value = event.data.glasses;
	  if(sex == 1){
	$("#skirt").css("display","none");  
	  }
	  else{
     $("#skirt").css("display","block");
      }
}
  });
  

  // Form update
  $('input').change(function(){	  
    $.post('http://redemrp_clothing/updateClothes', JSON.stringify({
      value: false,
// Body    
      hat: $('.hat').val(),
	  shirt: $('.shirt').val(),
	  vest: $('.vest').val(),
	  pants: $('.pants').val(),
	  mask: $('.mask').val(),
	  boots: $('.boots').val(),
	  skirt: $('.skirt').val(),
	  coat: $('.coat').val(),
	  gloves: $('.gloves').val(),
	  bandana: $('.bandana').val(),
	  gunbelts: $('.gunbelts').val(),
	  belts: $('.belts').val(),
	  beltbuckle: $('.beltbuckle').val(),
	  offhand: $('.offhand').val(),
	  neckties: $('.neckties').val(),
	  suspenders: $('.suspenders').val(),
	  spurs: $('.spurs').val(),
	  poncho: $('.poncho').val(),
	  eyewear: $('.eyewear').val(),
    }));
  });
  
  
  $('.arrow').on('click', function(e){
    e.preventDefault();
    $.post('http://redemrp_clothing/updateClothes', JSON.stringify({
      value: false,
// Body
      hat: $('.hat').val(),
	  shirt: $('.shirt').val(),
	  vest: $('.vest').val(),
	  pants: $('.pants').val(),
	  mask: $('.mask').val(),
	  boots: $('.boots').val(),
	  skirt: $('.skirt').val(),
	  coat: $('.coat').val(),
	  gloves: $('.gloves').val(),
	  bandana: $('.bandana').val(),
      gunbelts: $('.gunbelts').val(),
	  belts: $('.belts').val(),
	  beltbuckle: $('.beltbuckle').val(),
	  offhand: $('.offhand').val(),
	  neckties: $('.neckties').val(),
	  suspenders: $('.suspenders').val(),
	  spurs: $('.spurs').val(),
	  poncho: $('.poncho').val(),
	  eyewear: $('.eyewear').val(),
    }));
  });

  // Form submited
  $('.yes').on('click', function(e){
    e.preventDefault();
    $.post('http://redemrp_clothing/saveClothes', JSON.stringify({
      value: true,
      hat: $('.hat').val(),
	  shirt: $('.shirt').val(),
	  vest: $('.vest').val(),
	  pants: $('.pants').val(),
	  mask: $('.mask').val(),
	  boots: $('.boots').val(),
	  skirt: $('.skirt').val(),
	  coat: $('.coat').val(),
	  gloves: $('.gloves').val(),
	  bandana: $('.bandana').val(),
	  gunbelts: $('.gunbelts').val(),
	  belts: $('.belts').val(),
	  beltbuckle: $('.beltbuckle').val(),
	  offhand: $('.offhand').val(),
	  neckties: $('.neckties').val(),
	  suspenders: $('.suspenders').val(),
	  spurs: $('.spurs').val(),
	  poncho: $('.poncho').val(),
	  eyewear: $('.eyewear').val(),
	  name: $("#name").val()
    }));
  }); 
  
    $('.exit').on('click', function(e){
    e.preventDefault();
    $.post('http://redemrp_clothing/exit');
  }); 
  
  // Rotate player
  $(document).keypress(function(e) {
    if(e.which == 113){ // Q pressed
      $.post('http://redemrp_clothing/heading', JSON.stringify({
        value: -10
      }));
    }
  if(e.which == 100){ // D pressed
      $.post('http://redemrp_clothing/defcam');
    }
    if(e.which == 101){ // E pressed
      $.post('http://redemrp_clothing/heading', JSON.stringify({
        value: 10
      }));
    }
  });



});

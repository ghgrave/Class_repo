let mutants =
    document.getElementsByClassName("mutant")[0];

mutants.addEventListener("click", (evt)=> {
    console.log("Event:", evt)
    mutants.innerContent = "Sam rules!!!!"
})
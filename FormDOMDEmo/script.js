let name = document.getElementById("first_name");
let emailResult = document.getElementById("email");
let pwd = document.getElementById("pwd");
// console.log("Input: ", input)
let btn = document.getElementsByTagName("button")[0]
console.log("Btn: ", btn)


btn.addEventListener("click", function(e){
    let name = document.getElementById("first_name");
    e.preventDefault()
    // let first_name = name.value
    // let email = emailResult.value
    // let password = pwd.value
    console.log("Result of input: ", first_name, email, password)

    let data = {
        first_name: name.value,
        email: emailResult.value,
        password: pwd.value,
        _id: new Date()
    }
    console.log(data)
    console.log(JSON.stringify(data))
})


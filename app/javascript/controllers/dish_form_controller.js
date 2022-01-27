import { Controller } from "@hotwired/stimulus"
import axios from 'axios'

export default class extends Controller {
  static targets = ["ingredientField", "ingredientAutocomplete", "suggestions", "ingredientId", "btnAddIngredient", "ingredientsList", "submitBtn"]

  enableAddIngredientBtn(){
    this.btnAddIngredientTarget.disabled = false
    this.btnAddIngredientTarget.classList.add("bg-blue-500")
    this.btnAddIngredientTarget.classList.add("hover:bg-blue-600")
    this.btnAddIngredientTarget.classList.remove("bg-blue-200")
    this.btnAddIngredientTarget.classList.remove("hover:bg-blue-300")
    this.btnAddIngredientTarget.title = ""
  }

  disableAddIngredientBtn(){
    this.btnAddIngredientTarget.disabled = true
    this.btnAddIngredientTarget.classList.add("bg-blue-200")
    this.btnAddIngredientTarget.classList.add("hover:bg-blue-300")
    this.btnAddIngredientTarget.classList.remove("bg-blue-500")
    this.btnAddIngredientTarget.classList.remove("hover:bg-blue-600")
    this.btnAddIngredientTarget.title = "Please select an ingredient before adding it to the dish"
  }

  fillAutocomplete(){
    const name = this.ingredientAutocompleteTarget.value
      if(name.length) {
        axios.get(`/ingredients.json?q=${name}`)
          .then( response => {
            const autocompleteValues = response.data
            this.suggestionsTarget.innerHTML = `
              ${autocompleteValues.map((value) => {
                  return (
                         `<li data-value="${value.id}" data-name="${value.name}" data-action="click->dish-form#selectIngredient" class=" text-gray-900 cursor-default select-none relative py-1 pl-3 pr-9 rounded-md hover:bg-blue-200">${value.name}</li>`
                        )
                }).join('')}`
            })
      } else {
        this.suggestionsTarget.innerHTML = ``
      }
  }

  clearSelectedIngredientInput(){
    this.disableAddIngredientBtn()
    this.ingredientIdTarget.value=''
  }

  changeAutocomplete(){
    this.clearSelectedIngredientInput()
    this.fillAutocomplete()
  }

  selectIngredient(element){
    const ingredient_id = element.target.dataset.value
    const ingredient_ids =[]
    this.ingredientAutocompleteTarget.value = element.target.dataset.name
    this.suggestionsTarget.innerHTML = ``
    document.getElementsByName("dish[ingredients][]").forEach(element => {
      ingredient_ids.push(element.value)
    })
    if(!!ingredient_ids.length && ingredient_ids.includes(ingredient_id)){
      this.btnAddIngredientTarget.title = "Please select an ingredient that is not in the list"
    } else {
      this.ingredientIdTarget.value = ingredient_id
      this.enableAddIngredientBtn()
    }
  }

  verifySubmit(){
    const totalElementsInList = this.ingredientsListTarget.getElementsByTagName("li").length
    if(totalElementsInList >1){
      this.submitBtnTarget.disabled = false

    } else {
      this.submitBtnTarget.disabled = true

    }
  }

  addIngredient(){
    const id = this.ingredientIdTarget.value
    const name = this.ingredientAutocompleteTarget.value
    this.ingredientsListTarget.innerHTML +=
    `<div class="relative">
      <input
          type="hidden"
          value="${id}"
          name="dish[ingredients][]"/>
        <li class="text-gray-900 cursor-default  relative py-1 pl-3 pr-9"> ${name}</li>
        <div class="absolute top-1 right-2">
          <button
            type="button"
            data-action="click->dish-form#removeIngredient"
            class="h-6 w-8 text-white rounded-lg bg-red-500 hover:bg-red-600 shadow"
            title="Remove"
            >-</button>
        </div>
      </div>
      `
    this.clearSelectedIngredientInput()
    this.ingredientAutocompleteTarget.value = ''
    this.verifySubmit()
  }

  removeIngredient(event){
    event.target.parentElement.parentElement.remove()
    this.verifySubmit()
  }

  connect() {
    if(!!document.getElementById('autocompleteArea')){
        window.addEventListener('click', (e) => {
        if (!!document.getElementById('autocompleteArea') && !document.getElementById('autocompleteArea').contains(e.target)){
          this.suggestionsTarget.innerHTML = ``
        }
      })
    }

    this.ingredientAutocompleteTarget.addEventListener('focus', event => this.fillAutocomplete())

    this.ingredientAutocompleteTarget.addEventListener('input',(event) => this.changeAutocomplete())

  }
}
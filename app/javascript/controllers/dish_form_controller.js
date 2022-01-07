import { Controller } from "@hotwired/stimulus"
import { Autocomplete } from 'stimulus-autocomplete'
//import 'js-autocomplete/auto-complete.css';
import autocomplete from "js-autocomplete"
export default class extends Controller {
  static targets = ["autocomplete", "search"]
  test(){
    console.log("run test")
  }
  renderItem = function (item) {
      let icon;
      if (item.type === 'user') {
        icon = '<i class="fab fa-github"></i>';
      } else if (item.type === 'skill') {
        icon = '<i class="fas fa-code"></i>';
      }
      return `<div class="autocomplete-suggestion">${icon}<span>${item.name}</span></div>`
  };
  autocompleteSearch() {
    const ingredients = JSON.parse(this.autocompleteTarget.dataset.ingredients)
    const searchInput = this.searchTarget
    if (ingredients && searchInput) {
      new autocomplete({
        selector: searchInput,
        minChars: 1,
        source: function(term, suggest){
            term = term.toLowerCase();
            const choices = ingredients;
            let matches = []
            for (let i = 0; i < choices.length; i++)
              if (~choices[i].name.toLowerCase().indexOf(term)) matches.push(choices[i].name);
              console.log("matches", matches)
            suggest(matches);
        },
        renderItem: renderItem,
      });
    }
  };

  connect() {
    //this one works document.getElementById('testButton').addEventListener("click", this.test);
    //$('#testButton').on('click', () => this.test())
    this.test()
  }

  autocompleteTargetConnected(element){
    console.log("autocomplete conected")
    //this.autocompleteSearch()

  }
}
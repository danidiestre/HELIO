const displaySentences = () => {
  const element = document.getElementById("loading-sentence");
  if (!element) {
    return
  }
  let index = 0
  setInterval(() => {
    // call the function with the index
    sentenceIndex(index);
    index += 1
  }, 2000)
}

const sentenceIndex = (index) => {
  const element = document.getElementById("loading-sentence");
  const sentences = JSON.parse(element.dataset.sentences);
  const sentence = sentences[index];
  element.innerHTML = sentence + "..."
}

const myFunction = () => {
  const myVar = setTimeout(showPage, 8000);
}

const showPage = () => {
  document.getElementById("loader").style.display = "none";
  document.getElementById("myDiv").style.display = "block";
}

export { displaySentences, myFunction };


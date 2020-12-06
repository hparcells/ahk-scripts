const fetch = require('node-fetch');

const randomNumber = () => {
  return ['20', '21', '30', '31'][Math.floor((Math.random()*4))] + ((Math.random()*1e7).toFixed(0).padStart(7, '0')).toString()
}

const checkUrl = () => {
  let url = 'https://www.homedepot.com/p/'+randomNumber();
  fetch(url, {}).then(res => {
      if (res.status >= 300) {
        return checkUrl();
      }
      console.log(url);
  });
};

checkUrl();

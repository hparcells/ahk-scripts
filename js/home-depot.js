const fetch = require('node-fetch');

const checkUrl = () => {
    let url = 'https://www.homedepot.com/p/20'+(Math.random() * 1e7).toFixed(0).padStart(7, '0');
    fetch(url, {}).then(res => {
        if (res.status >= 300) {
            return checkUrl();
        }
        console.log(url);
    });
};

checkUrl();

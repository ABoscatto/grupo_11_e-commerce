const fs = require('fs');
const path = require('path');

const model = {
    fileRoute: path.join(__dirname, '../data/products.json'),

    findAll: () => {
        const jsonData = fs.readFileSync(model.fileRoute, 'utf-8');
        // convierto JSON en javascript
        const albums = JSON.parse(jsonData);
        return albums;
    },

    findById: (id) => {
    }
}

module.exports = model;

/* global use, db */
// MongoDB Playground
// Use Ctrl+Space inside a snippet or a string literal to trigger completions.

const database = 'EasyLoc';
const collection = 'Vehicle';

// The current database to use.
use(database);

// Create a new collection.
//db.createCollection(collection);

// The prototype form to create a collection:
 db.createCollection( collection

)


//insertion de plusieurs donnéess
db.Customer.insertMany(
  [
  {
    licence_plate: "AD987AZ",
    information: "rétroviseur droit détérioré",
    km: 25695,
    
  },
  {
    licence_plate: "BR562TE",
    information: "griffe pare choc avant droit",
    km: 47896,
  },
  {
    licence_plate: "GF654RE",
    information: "siège arrière droit dégradé",
    km: 7899,
  },
  {
    licence_plate: "GF753DS",
    information: "porte avant gauche griffée",
    km: 6548,
  }

]
)


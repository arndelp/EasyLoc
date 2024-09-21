

const database = 'EasyLoc';
const collection = 'Customer';

// The current database to use.
use(database);

// Create a new collection, sans options.

 db.createCollection( collection   
 )
//insérer un document 
 db.Customer.insertOne(
    {
    first_name: "Alphonse",
    second_name: "Brown",
    address: "15, rue de la paix, Paris",
    permit_number: "2tre856jhy78"
    }
 )

//insérer plusieurs documents 
db.Customer.insertMany(
  {
    first_name: "Robert",
    second_name: "Flakes",
    address: "17, rue de la fromagerie, Neuchatel-en-bray",
    permit_number: "65hgf89htfferr"
  },
  {
    first_name: "Lucas",
    second_name: "Di meo",
    address: "103, boulevard des écoles, Lille ",
    permit_number: "856gffrdrgdrvsf"
  },
  {
    first_name: "Raphaël",
    second_name: "Torti",
    address: "12, rue du clos moulin, Abbeville",
    permit_number: "98fregrgregfsgf"
  }
)


//rechercher un document avec le nom alphonse
 db.Customer.find ({ first_name: "Alphonse"},{second_name:"Brown"})


//mettre à jour une donnée
 db.Customer.updateOne(
    {address: "15, rue de la paix, Paris"},{$set:{address: "56, rue de la mairie"}})    
 


//supprimer un document 
db.Customer.deleteOne(
  {first_name: "Raphaël"}
)

//Rechercher avec le nom+prénom
db.Customer.find ({ first_name: "Alphonse",second_name:"Brown"})


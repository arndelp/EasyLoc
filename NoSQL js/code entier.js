/////////////////Customer//////////////////////////
//Créer la base de donnée Customer


// The current database to use.
use('EasyLoc');
// Create a new collection.
 db.createCollection( 'Customer');





//Ajout des documents


use('EasyLoc');

// Create a new document in the collection.
db.getCollection('Customer').insertMany(
    
        [
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
        },
        {
            first_name: "Alphonse",
            second_name: "Brown",
            address: "15, rue de la paix, Paris",
            permit_number: "2tre856jhy78"
            }
        ]
      )
;

//Ajouter un élément
db.getCollection('Customer').insertOne({
    first_name: "Alphonse",
    second_name: "Brown",
    address: "15, rue de la paix, Paris",
    permit_number: "2tre856jhy78"
});


//rechercher un document avec le nom alphonse
db.getCollection('Customer').find ({ first_name: "Alphonse",second_name:"Brown"})

//supprimer un document 
db.deleteOne(
    {first_name: "Alphonse"}
  );




/////////Vehicle/////////

//Création de la collection

use('EasyLoc');

db.createCollection( 'Vehicle' );


//Ajout des documents dans Vehicle//


use('EasyLoc');
//Insertion plusieurs documents
db.getCollection('Vehicle').insertMany(
  
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
      );

//Rechercher un véhicule à partir de son numéro d'immatriculation

use('EasyLoc');

db.Vehicle.find ({ licence_plate: "AD987AZ" });

//Compte les véhicules ayant plus d'un certain kilométrage

use('EasyLoc');

db.Vehicle.find({km:{$gt: 10000} }).count();


//Compte les véhicules ayant moins d'un certain kilométrage

use('EasyLoc');

db.Vehicle.find({km:{$gt: 10000} }).count();
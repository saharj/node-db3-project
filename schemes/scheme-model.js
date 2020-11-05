// scheme-model
const db = require("../data/db-config");

function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes")
    .where({ id })
    .first()
    .then((scheme) => {
      if (scheme) {
        return scheme;
      } else {
        return Promise.resolve(null);
      }
    });
}

function findSteps(id) {
  return db("schemes as c")
    .join("steps as s", "c.id", "s.scheme_id")
    .where("c.id", id)
    .orderBy("s.step_number", "asc")
    .then((steps) => {
      return steps;
    });
}

function add(scheme) {
  return db("schemes")
    .insert(scheme)
    .then(([id]) => findById(id));
}

function update(changes, id) {
  return db("schemes")
    .where({ id })
    .update(changes)
    .then((changes) => (changes > 0 ? findById(id) : null));
}

function remove(id) {
  return db("schemes").where({ id }).del();
}

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove,
};

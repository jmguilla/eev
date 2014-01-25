import org.codehaus.groovy.grails.web.json.JSONObject

import com.jmguilla.eev.EEVQuestions
import com.jmguilla.eev.EEVRow
import com.jmguilla.eev.EEVRowsGroup
import com.jmguilla.eev.MagnitudeAnswer
import com.jmguilla.eev.Question
import com.jmguilla.eev.Role
import com.jmguilla.eev.User
import com.jmguilla.eev.UserRole

class BootStrap {

  def init = { servletContext ->
    JSONObject.NULL.metaClass.asBoolean = {-> false}

    //initializing data
    Role admin = null
    if(Role.count() < 3){
      admin = new Role(authority: "ROLE_ADMIN").save(failOnError: true)
      new Role(authority: "ROLE_OWNER").save(failOnError: true)
      new Role(authority: "ROLE_USER").save(failOnError: true)
    }
    if(User.count() < 1){
      UserRole.create(new User(username: "jmguilla", password: "jmguilla", email: "guillauj@gmail.com").save(failOnError: true), admin)
    }
    if(EEVQuestions.count() < 1){
      EEVQuestions eevTemplate = new EEVQuestions(title: 'Ecoute d\'entretien de vente')
      eevTemplate = eevTemplate.save(failOnError: true)

      EEVRowsGroup group = new EEVRowsGroup(title: 'Avant d\'entrer en scène', rank: new Integer(1)).save(failOnError: true)
      group.addToContents(new EEVRow( rank: new Integer(1), question: new Question( answerType: MagnitudeAnswer.class.name, question: "connaît les stocks produits phares")).save(failOnError: true))
      group.addToContents(new EEVRow( rank: new Integer(2), question: new Question( answerType: MagnitudeAnswer.class.name, question: "connaît les priorités produits du jour")).save(failOnError: true))
      group.addToContents(new EEVRow( rank: new Integer(3), question: new Question( answerType: MagnitudeAnswer.class.name, question: "connaît ses objectifs")).save(failOnError: true))
      group.addToContents(new EEVRow( rank: new Integer(4), question: new Question( answerType: MagnitudeAnswer.class.name, question: "dispose des outils d'aide à la vente")).save(failOnError: true))
      group.addToContents(new EEVRow( rank: new Integer(5), question: new Question( answerType: MagnitudeAnswer.class.name, question: "porte une tenue adéquate à la relation client")).save(failOnError: true))
      eevTemplate.addToContents(group.save(failOnError: true)).save(failOnError: true)

      group = new EEVRowsGroup(title: 'Unique: accueil personnalisé du client', rank: new Integer(2)).save(failOnError: true)
      group.addToContents(new EEVRow( rank: new Integer(1), question: new Question( answerType: MagnitudeAnswer.class.name, question: "sourit, dit bonjour")).save(failOnError: true))
      group.addToContents(new EEVRow( rank: new Integer(2), question: new Question( answerType: MagnitudeAnswer.class.name, question: "a un contact visuel")).save(failOnError: true))
      group.addToContents(new EEVRow( rank: new Integer(3), question: new Question( answerType: MagnitudeAnswer.class.name, question: "a une attitude dynamique")).save(failOnError: true))
      group.addToContents(new EEVRow( rank: new Integer(4), question: new Question( answerType: MagnitudeAnswer.class.name, question: "se synchronise avec le profil de son client")).save(failOnError: true))
      group.addToContents(new EEVRow( rank: new Integer(5), question: new Question( answerType: MagnitudeAnswer.class.name, question: "obtient de \"+\"")).save(failOnError: true))
      group.addToContents(new EEVRow( rank: new Integer(6), question: new Question( answerType: MagnitudeAnswer.class.name, question: "pose une question ouverte")).save(failOnError: true))
      eevTemplate.addToContents(group.save(failOnError: true)).save(failOnError: true)

      group = new EEVRowsGroup(title: 'Découverte des besoins et des motivations', rank: new Integer(3)).save(failOnError: true)
      group.addToContents(new EEVRow( rank: new Integer(1), question: new Question( answerType: MagnitudeAnswer.class.name, question: "utilise des questions ouvertes et factuelles")).save(failOnError: true))
      group.addToContents(new EEVRow( rank: new Integer(2), question: new Question( answerType: MagnitudeAnswer.class.name, question: "laisse parler son client: <strong>client 80%, vendeur 20%</strong>")).save(failOnError: true))

      EEVRowsGroup subGroup = new EEVRowsGroup(title: 'écoute son client et découvre:', rank: new Integer(3)).save(failOnError: true)
      group.addToContents(subGroup)
      subGroup.addToContents(new EEVRow( rank: new Integer(1), question: new Question( answerType: MagnitudeAnswer.class.name, question: "quoi: le projet du client")).save(failOnError: true))
      subGroup.addToContents(new EEVRow( rank: new Integer(2), question: new Question( answerType: MagnitudeAnswer.class.name, question: "pourquoi: l'usage du client")).save(failOnError: true))
      subGroup.addToContents(new EEVRow( rank: new Integer(3), question: new Question( answerType: MagnitudeAnswer.class.name, question: "quand: la date d'achat")).save(failOnError: true))
      subGroup.addToContents(new EEVRow( rank: new Integer(4), question: new Question( answerType: MagnitudeAnswer.class.name, question: "combien: budet, mensualité")).save(failOnError: true))
      subGroup.addToContents(new EEVRow( rank: new Integer(5), question: new Question( answerType: MagnitudeAnswer.class.name, question: "qui: profil, client pass, décideur, ...")).save(failOnError: true))
      subGroup.addToContents(new EEVRow( rank: new Integer(6), question: new Question( answerType: MagnitudeAnswer.class.name, question: "comment: concurrence")).save(failOnError: true))
      subGroup.addToContents(new EEVRow( rank: new Integer(7), question: new Question( answerType: MagnitudeAnswer.class.name, question: "les 3 motivations principales <strong>SONCASE</strong>")).save(failOnError: true))

      group.addToContents(new EEVRow( rank: new Integer(4), question: new Question( answerType: MagnitudeAnswer.class.name, question: "reformule pour valider (obtient des \"oui\")")).save(failOnError: true))
      group.addToContents(new EEVRow( rank: new Integer(5), question: new Question( answerType: MagnitudeAnswer.class.name, question: "utilise la découverte en étoiles (ventes complémentaires)")).save(failOnError: true))
      group.addToContents(new EEVRow( rank: new Integer(6), question: new Question( answerType: MagnitudeAnswer.class.name, question: "pose la question finale de reformulation")).save(failOnError: true))
      eevTemplate.addToContents(group.save(failOnError: true)).save(failOnError: true)

      group = new EEVRowsGroup(title: 'Argumentation et présentation des produits', rank: new Integer(4)).save(failOnError: true)
      group.addToContents(new EEVRow( rank: new Integer(1), question: new Question( answerType: MagnitudeAnswer.class.name, question: "propose 2 à 3 produits")).save(failOnError: true))
      group.addToContents(new EEVRow( rank: new Integer(2), question: new Question( answerType: MagnitudeAnswer.class.name, question: "met en avant les bénéfices client")).save(failOnError: true))
      group.addToContents(new EEVRow( rank: new Integer(3), question: new Question( answerType: MagnitudeAnswer.class.name, question: "associe les services et accessoires dans son offre")).save(failOnError: true))
      group.addToContents(new EEVRow( rank: new Integer(4), question: new Question( answerType: MagnitudeAnswer.class.name, question: "propose une offre de financement")).save(failOnError: true))
      group.addToContents(new EEVRow( rank: new Integer(5), question: new Question( answerType: MagnitudeAnswer.class.name, question: "fait une présentation dynamique de la solution")).save(failOnError: true))
      group.addToContents(new EEVRow( rank: new Integer(6), question: new Question( answerType: MagnitudeAnswer.class.name, question: "valorise le produit et les offres associées")).save(failOnError: true))
      group.addToContents(new EEVRow( rank: new Integer(7), question: new Question( answerType: MagnitudeAnswer.class.name, question: "écoute et accepte l'objection")).save(failOnError: true))
      group.addToContents(new EEVRow( rank: new Integer(8), question: new Question( answerType: MagnitudeAnswer.class.name, question: "répond à l'objection avec succès")).save(failOnError: true))
      eevTemplate.addToContents(group.save(failOnError: true)).save(failOnError: true)

      group = new EEVRowsGroup(title: 'Conclusion et fidélisation', rank: new Integer(5)).save(failOnError: true)
      group.addToContents(new EEVRow( rank: new Integer(1), question: new Question( answerType: MagnitudeAnswer.class.name, question: "sait repérer les feux verts (signaux d'achat)")).save(failOnError: true))
      group.addToContents(new EEVRow( rank: new Integer(2), question: new Question( answerType: MagnitudeAnswer.class.name, question: "utilise une technique de conclusion")).save(failOnError: true))
      group.addToContents(new EEVRow( rank: new Integer(3), question: new Question( answerType: MagnitudeAnswer.class.name, question: "a transformé un feu orange en feu vert")).save(failOnError: true))
      group.addToContents(new EEVRow( rank: new Integer(4), question: new Question( answerType: MagnitudeAnswer.class.name, question: "conforte l'achat")).save(failOnError: true))
      group.addToContents(new EEVRow( rank: new Integer(5), question: new Question( answerType: MagnitudeAnswer.class.name, question: "donne un conseil d'usaqge")).save(failOnError: true))
      group.addToContents(new EEVRow( rank: new Integer(6), question: new Question( answerType: MagnitudeAnswer.class.name, question: "prends congé: merci et aurevoir personnalisé")).save(failOnError: true))
      group.addToContents(new EEVRow( rank: new Integer(7), question: new Question( answerType: MagnitudeAnswer.class.name, question: "accompagne jusqu'au services financiers (selon le flux client)")).save(failOnError: true))
      group.addToContents(new EEVRow( rank: new Integer(8), question: new Question( answerType: MagnitudeAnswer.class.name, question: "fournit un service différenciant")).save(failOnError: true))
      eevTemplate.addToContents(group.save(failOnError: true)).save(failOnError: true)

      group = new EEVRowsGroup(title: 'Autres éléments', rank: new Integer(6)).save(failOnError: true)
      group.addToContents(new EEVRow( rank: new Integer(1), question: new Question( answerType: MagnitudeAnswer.class.name, question: "ordre des étapes <strong>AUDACE</strong>")).save(failOnError: true))
      group.addToContents(new EEVRow( rank: new Integer(2), question: new Question( answerType: MagnitudeAnswer.class.name, question: "Répartition du temps des étapes <strong>AUDACE</strong>")).save(failOnError: true))
      group.addToContents(new EEVRow( rank: new Integer(3), question: new Question( answerType: MagnitudeAnswer.class.name, question: "maîtrise et aisance de la conduite de l'entretien")).save(failOnError: true))
      group.addToContents(new EEVRow( rank: new Integer(4), question: new Question( answerType: MagnitudeAnswer.class.name, question: "tient compte du flux client")).save(failOnError: true))
      group.addToContents(new EEVRow( rank: new Integer(5), question: new Question( answerType: MagnitudeAnswer.class.name, question: "accueille les autres clients pendant l'entretien")).save(failOnError: true))
      eevTemplate.addToContents(group.save(failOnError: true)).save(failOnError: true)
    }
  }
  def destroy = {
  }
}

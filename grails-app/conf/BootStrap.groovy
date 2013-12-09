import org.codehaus.groovy.grails.web.json.JSONObject

import com.jmguilla.eev.EEVQuestions
import com.jmguilla.eev.EEVRow
import com.jmguilla.eev.EEVRowsGroup
import com.jmguilla.eev.MagnitudeAnswer
import com.jmguilla.eev.Question

class BootStrap {

  def init = { servletContext ->
    JSONObject.NULL.metaClass.asBoolean = {-> false}

    //initializing data
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
    group.addToContents(new EEVRow( rank: new Integer(2), question: new Question( answerType: MagnitudeAnswer.class.name, question: "laisse parler son client: <strong>client 80%, vendeur 20%<strong>")).save(failOnError: true))

    EEVRowsGroup subGroup = new EEVRowsGroup(title: 'écoute son client et découvre:', rank: new Integer(3)).save(failOnError: true)
    group.addToContents(subGroup)
    subGroup.addToContents(new EEVRow( rank: new Integer(1), question: new Question( answerType: MagnitudeAnswer.class.name, question: "quoi: le projet du client")).save(failOnError: true))
    subGroup.addToContents(new EEVRow( rank: new Integer(2), question: new Question( answerType: MagnitudeAnswer.class.name, question: "pourquoi: l'usage du client")).save(failOnError: true))
    subGroup.addToContents(new EEVRow( rank: new Integer(3), question: new Question( answerType: MagnitudeAnswer.class.name, question: "quand: la date d'achat")).save(failOnError: true))
    subGroup.addToContents(new EEVRow( rank: new Integer(4), question: new Question( answerType: MagnitudeAnswer.class.name, question: "combien: budet, mensualité")).save(failOnError: true))
    subGroup.addToContents(new EEVRow( rank: new Integer(5), question: new Question( answerType: MagnitudeAnswer.class.name, question: "qui: profil, client pass, décideur, ...")).save(failOnError: true))
    subGroup.addToContents(new EEVRow( rank: new Integer(6), question: new Question( answerType: MagnitudeAnswer.class.name, question: "comment: concurrence")).save(failOnError: true))
    subGroup.addToContents(new EEVRow( rank: new Integer(7), question: new Question( answerType: MagnitudeAnswer.class.name, question: "les 3 motivations principales <strong>SONCASE<strong>")).save(failOnError: true))

    group.addToContents(new EEVRow( rank: new Integer(4), question: new Question( answerType: MagnitudeAnswer.class.name, question: "reformule pour valider (obtient des \"oui\")")).save(failOnError: true))
    group.addToContents(new EEVRow( rank: new Integer(5), question: new Question( answerType: MagnitudeAnswer.class.name, question: "utilise la découverte en étoiles (ventes complémentaires)")).save(failOnError: true))
    group.addToContents(new EEVRow( rank: new Integer(6), question: new Question( answerType: MagnitudeAnswer.class.name, question: "pose la question finale de reformulation")).save(failOnError: true))
    eevTemplate.addToContents(group.save(failOnError: true)).save(failOnError: true)
  }
  def destroy = {
  }
}

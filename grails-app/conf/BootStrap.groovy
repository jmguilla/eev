import com.jmguilla.eev.EEV
import com.jmguilla.eev.EEVRow
import com.jmguilla.eev.EEVRowsGroup
import com.jmguilla.eev.MagnitudeAnswer
import com.jmguilla.eev.Question
import com.jmguilla.eev.User

class BootStrap {

    def init = { servletContext ->
      
      //initializing data
      EEV eevTemplate = new EEV(title: 'Ecoute d\'entretien de vente')
      eevTemplate.interviewee = new User()
      eevTemplate.interviewee.email = ''
      eevTemplate.interviewee = eevTemplate.interviewee.save(failOnError: true)
      eevTemplate.interviewer = eevTemplate.interviewee
      eevTemplate = eevTemplate.save(failOnError: true)
      
      EEVRowsGroup group = new EEVRowsGroup(title: 'Avant d\'entrer en scène', rank: new Integer(1))
      group = group.save(failOnError: true)
      group.addToContents(new EEVRow( rank: new Integer(1), question: new Question(question: "connaît les stocks produits phares").save(failOnError: true), answer: new MagnitudeAnswer().save(faileOnError: true)))
      group.addToContents(new EEVRow( rank: new Integer(2), question: new Question(question: "connaît les priorités produits du jour").save(failOnError: true), answer: new MagnitudeAnswer().save(faileOnError: true)))
      group.addToContents(new EEVRow( rank: new Integer(3), question: new Question(question: "connaît ses objectifs").save(failOnError: true), answer: new MagnitudeAnswer().save(faileOnError: true)))
      group.addToContents(new EEVRow( rank: new Integer(4), question: new Question(question: "dispose des outils d'aide à la vente").save(failOnError: true), answer: new MagnitudeAnswer().save(faileOnError: true)))
      group.addToContents(new EEVRow( rank: new Integer(5), question: new Question(question: "porte une tenue adéquate à la relation client").save(failOnError: true), answer: new MagnitudeAnswer().save(faileOnError: true)))
      eevTemplate.addToContents(group.save(failOnError: true)).save(failOnError: true)
      
      group = new EEVRowsGroup(title: 'Unique: accueil personnalisé du client', rank: new Integer(2))
      group = group.save(failOnError: true)
      group.addToContents(new EEVRow( rank: new Integer(1), question: new Question(question: "sourit, dit bonjour").save(failOnError: true), answer: new MagnitudeAnswer().save(faileOnError: true)))
      group.addToContents(new EEVRow( rank: new Integer(2), question: new Question(question: "a un contact visuel").save(failOnError: true), answer: new MagnitudeAnswer().save(faileOnError: true)))
      group.addToContents(new EEVRow( rank: new Integer(3), question: new Question(question: "a une attitude dynamique").save(failOnError: true), answer: new MagnitudeAnswer().save(faileOnError: true)))
      group.addToContents(new EEVRow( rank: new Integer(4), question: new Question(question: "se synchronise avec le profil de son client").save(failOnError: true), answer: new MagnitudeAnswer().save(faileOnError: true)))
      group.addToContents(new EEVRow( rank: new Integer(5), question: new Question(question: "obtient de \"+\"").save(failOnError: true), answer: new MagnitudeAnswer().save(faileOnError: true)))
      group.addToContents(new EEVRow( rank: new Integer(6), question: new Question(question: "pose une question ouverte").save(failOnError: true), answer: new MagnitudeAnswer().save(faileOnError: true)))
      eevTemplate.addToContents(group.save(failOnError: true)).save(failOnError: true)
      
      group = new EEVRowsGroup(title: 'Découverte des besoins et des motivations', rank: new Integer(3))
      group = group.save(failOnError: true)
      group.addToContents(new EEVRow( rank: new Integer(1), question: new Question(question: "utilise des questions ouvertes et factuelles").save(failOnError: true), answer: new MagnitudeAnswer().save(faileOnError: true)))
      group.addToContents(new EEVRow( rank: new Integer(2), question: new Question(question: "laisse parler son client: <strong>client 80%, vendeur 20%<strong>").save(failOnError: true), answer: new MagnitudeAnswer().save(faileOnError: true)))
      
      EEVRowsGroup subGroup = new EEVRowsGroup(title: 'écoute son client et découvre:', rank: new Integer(3))
      group.addToContents(subGroup.save(failOnError: true))
      subGroup.addToContents(new EEVRow( rank: new Integer(1), question: new Question(question: "quoi: le projet du client").save(failOnError: true), answer: new MagnitudeAnswer().save(faileOnError: true)))
      subGroup.addToContents(new EEVRow( rank: new Integer(2), question: new Question(question: "pourquoi: l'usage du client").save(failOnError: true), answer: new MagnitudeAnswer().save(faileOnError: true)))
      subGroup.addToContents(new EEVRow( rank: new Integer(3), question: new Question(question: "quand: la date d'achat").save(failOnError: true), answer: new MagnitudeAnswer().save(faileOnError: true)))
      subGroup.addToContents(new EEVRow( rank: new Integer(4), question: new Question(question: "combien: budet, mensualité").save(failOnError: true), answer: new MagnitudeAnswer().save(faileOnError: true)))
      subGroup.addToContents(new EEVRow( rank: new Integer(5), question: new Question(question: "qui: profil, client pass, décideur, ...").save(failOnError: true), answer: new MagnitudeAnswer().save(faileOnError: true)))
      subGroup.addToContents(new EEVRow( rank: new Integer(6), question: new Question(question: "comment: concurrence").save(failOnError: true), answer: new MagnitudeAnswer().save(faileOnError: true)))
      subGroup.addToContents(new EEVRow( rank: new Integer(7), question: new Question(question: "les 3 motivations principales <strong>SONCASE<strong>").save(failOnError: true), answer: new MagnitudeAnswer().save(faileOnError: true)))
      
      group.addToContents(new EEVRow( rank: new Integer(4), question: new Question(question: "reformule pour valider (obtient des \"oui\")").save(failOnError: true), answer: new MagnitudeAnswer().save(faileOnError: true)))
      group.addToContents(new EEVRow( rank: new Integer(5), question: new Question(question: "utilise la découverte en étoiles (ventes complémentaires)").save(failOnError: true), answer: new MagnitudeAnswer().save(faileOnError: true)))
      group.addToContents(new EEVRow( rank: new Integer(6), question: new Question(question: "pose la question finale de reformulation").save(failOnError: true), answer: new MagnitudeAnswer().save(faileOnError: true)))
      eevTemplate.addToContents(group.save(failOnError: true)).save(failOnError: true)
    }
    def destroy = {
    }
}

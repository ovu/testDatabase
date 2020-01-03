
import slick.jdbc.PostgresProfile.api._
import scala.concurrent.Await
import scala.concurrent.duration._
import scala.language.postfixOps
object Main extends App {

  case class MusicType(id: Int, name: String)

  class MusicTypeTable(tag: Tag) extends Table[MusicType](tag, Some("test"), "musictype") {
    def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
    def name = column[String]("name")

    def * = (id, name).mapTo[MusicType]
  }

  val sqldb = slick.jdbc.JdbcBackend.Database.forConfig("yomama")
  val dbUrl = "jdbc:postgresql://localhost:5432/postgres?user=postgres&password=";
  val dbUsername = "postgres"
  val dbPassword = ""
  val dbDriver = "org.postgresql.Driver"

//  val sqldb = Database.forURL(url = dbUrl, driver = dbDriver, user = dbUsername, password = dbPassword)
  //val sqldb = Database.forURL(url = dbUrl, driver = dbDriver)

  val musicType = TableQuery[MusicTypeTable]

  val query = musicType.filter(_.id === 1)

  val res = sqldb.run(query.result)

  val resList = Await.result(res, 5 seconds)

  println(resList)


}

using System.Data.SQLite;

string cs = "Data Source=:memory:";
string stm = "SELECT SQLITE_VERSION()";

using var con = new SQLiteConnection(cs);
con.Open();

using var cmd = new SQLiteCommand(stm, con);
string version = cmd.ExecuteScalar().ToString();

Console.WriteLine($"SQLite version: {version}");
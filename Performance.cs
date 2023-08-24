namespace H1_Database_connection
{
    // Lavet af Yordan, Shazil, Jonas, Magnus

    internal class Program
    {
        static void Main()
        {
            Controller();
        }

        static void Controller()
        {
            // Create variable for id and create a random class variable
            int id = 0;
            Random random = new Random();

            // Loop that runs 1 million times
            for (int i = 0; i < 1000000; i++)
            {
                // Increase the value of id by 1 
                id++;

                // Give a random value to the a new variable called randomValue.
                int randomValue = random.Next(0, 9999);

                // Gives values to the Model method, which calls the database
                Model(id, randomValue);
                ConsoleView(id);
            }
        }

        static void Model(int id, int randomValue)
        {
            // Uses streamwriter to write into the destination text file.
            // It writes the column names first and then it outputs the id and random values
            using (StreamWriter sw = File.AppendText(@"C:\Users\zbcmhlun\Desktop\H1\Database\performance.txt"))
            {
                if (id == 1)
                {
                    sw.WriteLine("id, randomValue");
                }

                sw.WriteLine($"{id}, {randomValue}");
            }
        }

        static void ConsoleView(int id)
        {
            Console.WriteLine(id);
        }
    }
}

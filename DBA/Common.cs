using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography;
using System.IO;

namespace DBA
{
    public class Common
    {
        public static object stingToDbNull(string param)
        {
            if (param.Trim().Length <= 0)
            {
                return DBNull.Value;
            }
            return param;
        }

        public static object intToDBNull(int param)
        {
            if (param < 0)
            {
                return DBNull.Value;
            }
            return param;
        }

        public static object floatToDBNull(float param)
        {
            if (param < 0)
            {
                return DBNull.Value;
            }
            return param;
        }
        public static object doubleToDBNull(double param)
        {
            if (param < -999999)
            {
                return DBNull.Value;
            }
            return param;
        }


        public static object dateToDbNull(DateTime? param)
        {
            if (param ==null)
            {
                return DBNull.Value;
            }
            return param;
        }

        public static object stringArrayToDBNull(string[] param)
        {
            if (param ==null)
            {
                return DBNull.Value;
            }
            return param;
        }

        public static object intArrayToDBNull(int[] param)
        {
            if (param == null)
            {
                return DBNull.Value;
            }
            return param;
        }

        public static object boolToDbNull(bool? param)
        {
            if (param == null)
            {
                return DBNull.Value;
            }
            return param;
        }

        public static string Encrypt(string clearText)
        {
            try
            {
                string EncryptionKey = "MAKV2SPBNI99212";
                byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
                using (Aes encryptor = Aes.Create())
                {
                    Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                    encryptor.Key = pdb.GetBytes(32);
                    encryptor.IV = pdb.GetBytes(16);
                    using (MemoryStream ms = new MemoryStream())
                    {
                        using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                        {
                            cs.Write(clearBytes, 0, clearBytes.Length);
                            cs.Close();
                        }
                        clearText = Convert.ToBase64String(ms.ToArray());
                    }
                }
            }
            catch { }
            return clearText;
        }

        public static string Decrypt(string cipherText)
        {
            try
            {
                string EncryptionKey = "MAKV2SPBNI99212";
                cipherText = cipherText.Replace(" ", "+");
                byte[] cipherBytes = Convert.FromBase64String(cipherText);
                using (Aes encryptor = Aes.Create())
                {
                    Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                    encryptor.Key = pdb.GetBytes(32);
                    encryptor.IV = pdb.GetBytes(16);
                    using (MemoryStream ms = new MemoryStream())
                    {
                        using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                        {
                            cs.Write(cipherBytes, 0, cipherBytes.Length);
                            cs.Close();
                        }
                        cipherText = Encoding.Unicode.GetString(ms.ToArray());
                    }
                }
            }
            catch { }
            return cipherText;
        }
        
    }
}

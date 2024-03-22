using Newtonsoft.Json;

namespace Quiz.Helper
{
    public static class CookiesExtensions
    {
        public static void SetCookies(this IResponseCookies cookie, string key, object value)
        {
            var obj = JsonConvert.SerializeObject(value);
            cookie.Append(key, obj);
        }
        public static T? GetCookies<T>(this IRequestCookieCollection cookie, string key)
        {
            var value = cookie[key];
            return value == null ? default : JsonConvert.DeserializeObject<T>(value);
        }
        public static void DeleteCookies(this IResponseCookies cookie, string key)
        {
            cookie.Delete(key);
        }
    }
}

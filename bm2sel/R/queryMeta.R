#' arbitrary slice of metadata in public mongodb
#' @import mongolite
#' @examples
#' m1 = humrnaMeta()
#' m1$count()
#' m1$find(limit=1)
#' @export
humrnaMeta = function()
  mongo(url="mongodb://mongo.channingremotedata.org:27017", db="minihumrna",
     collection="humrna")

#' helper for regex construction for mongolite find
#' @importFrom rjson toJSON
#' @param fld character(1) field name
#' @param patt character(1) regex string
#' @param opt character(1) option string, 'i' means case-insensitive, an option seems obligatory
#' @examples
#' makeRegex()
#' @export
makeRegex = function(fld="run_center_name", patt="UT", opt="i") {
  qq = list(tmp=list(`$regex`=patt, `$options`=opt))
  names(qq) = fld
  toJSON(qq)
}

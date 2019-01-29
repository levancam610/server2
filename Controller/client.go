package Controller

import (
	"../DTO"
	"../Database"
	"github.com/gin-gonic/gin"
	"strconv"
)

type Post struct {
	Id        int    `json:"id"`
	FirstName string `json:"title"`
	LastName  string
	Email     string
	UserName  string
	PassWord  string
}

type Clothes struct {
	Id         int
	Name       string
	CategoryId int
	Gender     string
	Amount     int
	Price      int
}
type DataClothes struct {
	TotalPage  int
	TotalCount int
	Data       []DTO.Clothes
}

func FindById(c *gin.Context) {
	/*
		db := database.DBConn()
		rows, err := db.Query("SELECT * FROM users WHERE id = " + c.Param("id"))
		if err != nil{
			c.JSON(500, gin.H{
				"messages" : "Story not found",
			});
		}

		 := Post{}

		for rows.Next(){
			var id, categoryId int
			var amount, price float32
			var name, gender string

			err = rows.Scan(&id, &name, &categoryId, &gender, &amount, &price)
			if err != nil {
				panic(err.Error())
			}

			post.Id = id
			post.FirstName = firstName
			post.LastName = lastName
			post.Email = email
			post.UserName = userName
			post.PassWord = passWord
		}

		c.JSON(200, post)
		defer db.Close() // Hoãn lại việc close database connect cho đến khi hàm Read() thực hiệc xong*/
}

func GetList(c *gin.Context) {
	currentPage := c.Query("currentPage")
	pageSize := c.Query("pageSize")
	orderBy := c.Query("orderBy")
	search := c.Query("search")
	categoryId := c.Query("categoryId")

	currentPage2, err1 := strconv.Atoi(currentPage)
	currentPage2 -= 1
	pageSize2, err2 := strconv.Atoi(pageSize)
	if err1 != nil || err2 != nil {
		panic("loi page ko convert dc integer")
	}
	from := strconv.Itoa(currentPage2 * pageSize2)
	/*page:= c.Param("page")
	tmp,err := strconv.Atoi(page)
	if(err!=nil){
		panic("loi page ko convert dc integer")
	}
	from := strconv.Itoa(tmp*12)

	db := database.DBConn()
	rows, err := db.Query("SELECT id, name, categoryId, gender, amount, price FROM clothes ORDER BY created desc limit "+from+",12")
	if err != nil{
		c.JSON(500, gin.H{
			"messages" : "Story not found",
		});
	}
	post := DTO.QuanDTO{}
	list := [] DTO.QuanDTO{}
	for rows.Next(){
		var id, categoryId int
		var amount, price int
		var name, gender string

		err = rows.Scan(&id, &name, &categoryId, &gender, &amount, &price)
		if err != nil {
			panic(err.Error())
		}

		post.Id = id
		post.Name = name
		post.Amount = amount
		post.CategoryId = categoryId
		post.Gender = gender
		post.Price = price
		list = append(list,post);

	}
	c.JSON(200, list)
	defer db.Close() // Hoãn lại việc close database connect cho đến khi hàm Read() thực hiệc xong*/
	//sql := "SELECT id, name, categoryId, gender, amount, price, image FROM clothes where categoryId="+categoryId+" and name like '%"+search+"%' ORDER BY "+orderBy+" desc limit "+from+","+pageSize;
	clothes := []DTO.Clothes{}
	db := Database.DBConn()
	db.Where("category_id=? AND name LIKE ?", categoryId, "%"+search+"%").Order(orderBy + " desc").Limit(pageSize).Offset(from).Find(&clothes)
	c.JSON(200, clothes)
	defer db.Close()

}

/*
func CreateClothes(c * gin.Context){
	db := Database.DBConn()
	var json DTO.Clothes
	json.Created = time.Now().Format("2006/01/02")
	err := c.BindJSON(&json)
	if err == nil {
		db.Create(&json)
		c.JSON(200, gin.H{
			"messages": "inserted",
		})
		return
	}
	c.JSON(500, gin.H{"error": err.Error()})
	defer db.Close()
}
*/
/* Get all category  */
func GetAllCategory(c *gin.Context) {
	db := Database.DBConn()
	category := []DTO.Clothes{}
	db.Find(&category)
	c.JSON(200, category)
	defer db.Close()
}

/*----------------------------- */

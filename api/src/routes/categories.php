<?php
class Categories
{
    public $id = -1;
    public $name = "";
    public $description = "";

    public static function getCatAll()
    {
        $categories = [];
        $mySql = DB::mySql();
        $query = "call getCatAll();";
        if ($cats = $mySql->query($query)) {
            $cats = $cats->fetchAll(PDO::FETCH_ASSOC);
            foreach($cats as $cat){
                $newCat = new Categories;
                $newCat->id = $cat['id'];
                $newCat->name = $cat['name'];
                $newCat->description = $cat['description'];
                $categories[$cat['catLable']][] = $newCat;
            }
            return json_encode ($categories, JSON_PRETTY_PRINT | JSON_NUMERIC_CHECK|JSON_UNESCAPED_UNICODE);
        }
    }
}

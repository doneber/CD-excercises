import express from 'express'
const db = require('./db.json')
const app = express()
// Functions to the API
function findIndexById(id:any): number {
  for (let index = 0; index < db.comments.length; index++)
    if (db.comments[index].id == id)
      return index
  return -1
}
function getComment (req:any, res:any){
  res.json(db.comments)
 }
function getCommentById (req:any, res:any){
  const index:number = findIndexById(req.params.CommentId)
  if (index >= 0){
    res.json(db.comments[index])
  }
  else
    res.send('Comment not found')
 }
function postComment (req:any, res:any){
  const newComment = {id: db.comments.length, title: req.body.title, content: req.body.title}
  db.comments.push(newComment)  
  res.json(newComment)
 }
function putComment (req:any, res:any){
  const index:number = findIndexById(req.params.CommentId)
  if (index >= 0){
    db.comments[index].title = req.body.title?req.body.title:db.comments[index].title
    db.comments[index].content = req.body.content?req.body.content:db.comments[index].content
    res.json(db.comments[index])
  }
  else
    res.send('Comment not found')
}
function deleteComment (req:any, res:any){
  const index:number = findIndexById(req.params.CommentId)
  if (index >= 0) {
    const Comment = db.comments[index]
    db.comments.splice(index,1)
    res.json(Comment)
  }
  else
    res.send('Comment not found')
 }
// Middlewares
app.use(express.urlencoded({ extended: false }))
app.use(express.json())

// Get all comments
app.get("/Comment", getComment)
// Get a comment by its Id
app.get("/Comment/:CommentId", getCommentById)
// Create a comment
app.post('/Comment', postComment)
// Update a Comment by its Id
app.put('/Comment/:CommentId', putComment)
// Delete a Comment by its Id
app.delete('/Comment/:CommentId', deleteComment)

const PORT = 8000
app.get('/', (req, res) => res.send('Express + TypeScript Server (ExpressTs)'))
app.listen(PORT, () => {
  console.log(`⚡️[server]: Server is running at localhost:${PORT}`)
})
const feelings = [{movie_id: 12344},"Awesome", "joy", "anger", "F&&&&&ing ridiculus!!!", "and more stuff!"]

// const newFeelings = [<li>Awesome</li>, <li>Joy</li>, <li>Anger</li>]

const newFeelings = feelings.map((data, i)=>{
        return (
            <MovieCard title={data.title}/>
        )
})


const ListOFeelings = () => {
    return(
        <>
            {newFeelings}
        </>
    )
}
export default ListOFeelings;